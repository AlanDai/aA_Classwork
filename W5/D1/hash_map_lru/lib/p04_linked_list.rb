class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    prev ? (prev.next = self.next; self.next && self.next.prev = prev) : self.next.prev = nil
  end
end

class LinkedList
  include Enumerable

  attr_reader :head, :tail

  def initialize
    @count = 0
    @head = Node.new
    @tail = Node.new
    reset_prev(head, tail)
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    head.next
  end

  def last
    tail.prev
  end

  def empty?
    head.next == tail
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def include?(key)
    self.any? {|node| node.key == key}
  end

  def append(key, val)
    last_node = tail.prev
    new_node = Node.new(key, val)
    reset_prev(last_node, new_node)
    reset_prev(new_node, tail)
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
      end
    end
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        reset_prev(node.prev, node.next)
        return
      end
    end
  end

  def each(&prc)
    prc ||= proc { |node| node }
    idx_node = head.next
    until idx_node == tail
      yield idx_node
      idx_node = idx_node.next
    end
  end

  private

  def reset_prev(node1, node2)
    node1.next = node2
    node2.prev = node1
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
