//
//  List.m
//  Objective-C线性表顺序结构
//
//  Created by Lix on 16/3/20.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import "List.h"

@implementation List



/**
 线性表的初始化 并分配存储单元
 
 - returns: SqList*
 */
SqList * initSqList()
{
    SqList * list = (SqList *)malloc(sizeof(SqList));
    
    list->length = 0 ;
    
    return list;
}

//获取线性表中的元素
Status GetElem (SqList * L , int i , ElementType e)
{
    if (L->length == 0 || i < 1 || i > L->length ) {
        return ERROR;
    }
    
    e = L->data[i-1];
    return SUCCESS;
}

//线性表以栈的方式加入数据
Status pushElement(ElementType e, SqList * list)
{
    int length = list->length;
    if (length < 0 || length > MAXSIZE) {
        return ERROR;
    }
    
    list->data[length] = e;
    list->length++;
    
    return SUCCESS;
}

/**
 *  在线性表中的第i个位置插入之前新的元素数据e，线性表的长度+1
 *
 */
Status insertElementWithLocation(ElementType e, SqList * list, int i)
{
    int k;
    //判断线性表的存储空间是否已满
    if (list->length == MAXSIZE) {
        return ERROR;
    }
    
    //判断i的合理性
    if (i < 1 || i > list->length) {
        return ERROR;
    }
    
    //将要插入的位置后面的数据向后移动一位
    if (i <= list->length) {
        for (k = list->length - 1; k >= i-1; k--) {
            list->data[k+i] = list->data[k];
        }
    }
    
    list->data[i-1] = e;  //插入新元素
    list->length++;
    return SUCCESS;
    
}

/**
 *  按照队列的方式插入元素
 */

Status intoQueueWithElement(ElementType e,SqList * list)
{
    Status error = insertElementWithLocation(e, list, 0);
    
    if (error == ERROR) {
        return ERROR;
    }
    
    return SUCCESS;
}

/**
 *  按照栈的方式删除元素 e用来接收删除出来的值
 */

Status popElement(ElementType e, SqList *list)
{
    int length = list->length;
    
    //判断线性表的合法性
    if (length < 0 || length > MAXSIZE) {
        return ERROR;
    }
    
    e = list->data[length - 1];
    list->length -- ;
    return SUCCESS;
}

/**
 *  在线性表中的第i个位置删除元素 线性表的长度减一
 */

Status deleteElementWithLocation(ElementType e, int i , SqList * list)
{
    //判断线性表的合法性
    if (list->length < 0 || list->length > MAXSIZE ) {
        return ERROR;
    }
    
    //判断删除位置的合法性
    if (i < 1 || i > list->length) {
        return ERROR;
    }
    
    e = list->data[i-1];
    
    if (i < list->length) {
        //将删除位置的后继元素前移
        for (int k = i; k < list->length; k++) {
            list->data[k-1] = list->data[k];
        }
    }
    
    list->length -- ;
    
    return SUCCESS;
}

/**
 *  遍历线性表
 */

Status displayList(SqList * list)
{
    if (list->length < 0 || list->length > MAXSIZE) {
        return ERROR;
    }
    
    printf("***************************\n");
    
    for (int i = 0; i < list->length; i++) {
        printf("数值 = %d , 地址 = %p\n",list->data[i], &list->data[i]);
    }
    printf("***************************\n");
    
    return SUCCESS;
}



@end
