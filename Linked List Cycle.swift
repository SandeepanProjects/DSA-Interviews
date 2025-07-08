//
//  Linked List Cycle.swift
//  
//
//  Created by Apple on 08/07/25.
//

import Foundation

/*
 Given head, the head of a linked list, determine if the linked list has a cycle in it.

Reference: https://leetcode.com/problems/linked-list-cycle/
 */

Using Floyd's Cycle-Finding Algorithm - O(n) Time and O(1) Space

func hasCycle(_ head: ListNode?) -> Bool {
      if head == nil || head?.next == nil { return false }
      //For space complexity - use two pointer - slow & fast
      var slow = head
      var fast = head?.next
      while slow?.val != fast?.val {
          if fast == nil || fast?.next == nil { return false }
          slow = slow?.next
          fast = fast?.next?.next
      }
      return true;
  }
