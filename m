Date: Thu, 9 Mar 2000 17:41:15 +0200 (SAST)
From: Bruce Hewitson <hewitson@egs.uct.ac.za>
Subject: [linux-lvm] 12 x UDMA disks -- problems
Message-ID: <Pine.LNX.4.10.10003091735500.19333-100000@tie.egs.uct.ac.za>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


I am trying to use 12x37Gig UDMA disks off 3 Promise/Ultra-66 ide
controlers providing 6 ide chains.  However, MAKEDEV will only create
devices hd[a-l] --- I need in addition devices hd[m-p].  I looked in the
MAKEDEV script, and can see two places where I can extend the devices to
inlude these, but am stumped whith the lines

...
...
major=`Major ide4 56`
major=`Major ide5 57`

For ide6 and ide7, how do I determine the Major numbers?

Any help appreciated.

 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 | Assoc. Prof. Bruce C. Hewitson                  Ph: +27 21 650 2878 |
 | Dept. Environmental & Geographical Sc.         Fax: +27 21 650 3791 |
 | University of Cape Town, Private Bag, Rondebosch, South Africa 7701 |
 |      hewitson@egs.uct.ac.za       http://www.egs.uct.ac.za/csag     |
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
