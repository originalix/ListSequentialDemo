//
//  List.h
//  Objective-C线性表顺序结构
//
//  Created by Lix on 16/3/20.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface List : NSObject

#define MAXSIZE 10          //存储空间的初始化分配

/**
 *  函数运行的状态代码
 *
 *
 */
#define SUCCESS 1
#define ERROR   0

typedef int Status;  //状态代码的类型


typedef int ElementType;    //定义线性表元素数据类型 这里假设为int

typedef struct
{
    ElementType data[MAXSIZE];      //线性表存储数据元素
    
    int length;                     //线性表的长度
    
}SqList;

SqList * initSqList();

Status GetElem (SqList * L , int i , ElementType e);

Status pushElement(ElementType e, SqList * list);

Status insertElementWithLocation(ElementType e, SqList * list, int i);

Status intoQueueWithElement(ElementType e,SqList * list);

Status popElement(ElementType e, SqList *list);

Status deleteElementWithLocation(ElementType e, int i , SqList * list);

Status displayList(SqList * list);


@end
