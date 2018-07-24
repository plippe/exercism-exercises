pub struct SimpleLinkedList<T> {
    head: Option<Box<Node<T>>>,
}

pub struct Node<T> {
    data: T,
    next: Option<Box<Node<T>>>,
}

impl<T> Node<T> {    
    pub fn len(&self) -> usize {
        self.next
            .as_ref()
            .map_or(1, |next| 1 + next.len())
    }
}

impl<T: Clone> Iterator for SimpleLinkedList<T> {    
    type Item = Box<Node<T>>;

    fn next(&mut self) -> Option<Box<Node<T>>> {
        None
        // mut let head = self.head.take();
        // self.head = self.head.take().and_then(|h| h.next);
        // self.head.take()
    }
}

// impl <T: Clone> DoubleEndedIterator for SimpleLinkedList<T> {    
//     fn next_back(&mut self) -> Option<Self::Item> {
//         None
//     }
// }

impl<T> SimpleLinkedList<T> {
    pub fn new() -> Self {
        SimpleLinkedList { head: None }
    }
    
    pub fn len(&self) -> usize {
        self.head
            .as_ref()
            .map_or(0, |head| head.len())
    }

    pub fn push(&mut self, _element: T) {
        let head = Node { data: _element, next: self.head.take() };
        self.head = Some(Box::new(head))
    }

    pub fn pop(&mut self) -> Option<T> {
        self.head
            .take()
            .map(|mut head| {
                self.head = head.next.take();
                head.data
            })
    }

    pub fn peek(&self) -> Option<&T> {
        self.head
            .as_ref()
            .map(|head| &head.data)
    }
}

impl<T: Clone> SimpleLinkedList<T> {
    pub fn rev(&self) -> SimpleLinkedList<T> {
        fn push<T: Clone>(new_list: &mut SimpleLinkedList<T>, node: &Option<Box<Node<T>>>) {
            node.as_ref()
                .map(|node| {
                    new_list.push(node.data.clone());
                    push(new_list, &node.next);
                });
        }

        let mut rev_list = SimpleLinkedList::new();
        push(&mut rev_list , &self.head);

        rev_list
    }
}

impl<'a, T: Clone> From<&'a [T]> for SimpleLinkedList<T> {
    fn from(_item: &[T]) -> Self {
        let mut list = SimpleLinkedList::new() as SimpleLinkedList<T>;
        _item.iter().for_each(|item| list.push(item.clone()));

        list
    }
}

impl<T: Clone> Into<Vec<T>> for SimpleLinkedList<T> {
    fn into(self) -> Vec<T> {
        // fn push<T: Clone>(vec: &mut Vec<T>, node: &Option<Box<Node<T>>>) {
        //     node.as_ref()
        //         .map(|node| {
        //             push(vec, &node.next);
        //             vec.push(node.data.clone());
        //         });
        // }

        // let mut vec = Vec::new();
        // push(&mut vec , &self.head);

        // vec;

        // self.head.map(|a| println!(" - {}", a));

        Vec::new()
    }
}
