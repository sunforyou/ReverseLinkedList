//
//  main.m
//  ReverseLinkedList
//
//  Created by 宋旭 on 16/3/15.
//  Copyright © 2016年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义链表的信息域与指针域
typedef struct Node_ {
    int value;
    struct Node_ *next;
} Node;

//节点构造器
Node *createNode(int value, Node *next) {
    Node *node = malloc(sizeof(Node));
    node->value = value;
    node->next = next;
    return node;
}

//递归逆序
Node *reverseList(Node *list) {
    if (list == NULL || list->next == NULL) {
        return list;
    }
    Node *head = reverseList(list->next);
    list->next->next = list;
    list->next = NULL;
    return head;
}

//输出链表内容
void printList(Node *firstNode) {
    for (Node *node = firstNode; node != NULL; node = node->next) {
        printf("%d\n",node->value);
    }
}

//销毁链表
void destroyList(Node *first) {
    Node *node = first;
    Node *tmp;
    
    while (node != NULL) {
        tmp = node;
        node = node->next;
        free(tmp);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Node *current = createNode(0, NULL);
        Node *first = current;
        
        for (int i=1; i<10; i++) {
            current->next = createNode(i, NULL);
            current = current->next;
        }
        
        printList(first);
        printf("Reverse:\n");
        printList(reverseList(first));
        
        destroyList(first);
    }
    return 0;
}
