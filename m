Message-ID: <38C80EA5.79AB60C@mindless.com>
Date: Thu, 09 Mar 2000 15:50:46 -0500
From: Michael Loftis <zop12@mindless.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 12 x UDMA disks -- problems
References: <Pine.LNX.4.10.10003091735500.19333-100000@tie.egs.uct.ac.za>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Bruce Hewitson <hewitson@egs.uct.ac.za>
Cc: linux-lvm@msede.com

ide0..ide5

The ide count is 0 based.  Major number is that of the ide controller.
Minor is that of the 'right' partition.

ide4 master is 56,0 (hdi)  and ide4 slave is 56,64 (hdj) my notation is
major/minor so

mknod hdi b 56 0
mknod hdj b 56 64

Would get you the correct entries.  Partitions are +1 so hdi1 is
mknod hdi1 b 56 1
mknod hdi2 b 56 2

And for hdj

mknod hdj1 b 56 65
mknod hdj2 b 56 66


That is assuming the major number you quoted below is correct :)

Michael Loftis


Bruce Hewitson wrote:

> I am trying to use 12x37Gig UDMA disks off 3 Promise/Ultra-66 ide
> controlers providing 6 ide chains.  However, MAKEDEV will only create
> devices hd[a-l] --- I need in addition devices hd[m-p].  I looked in the
> MAKEDEV script, and can see two places where I can extend the devices to
> inlude these, but am stumped whith the lines
>
> ...
> ...
> major=`Major ide4 56`
> major=`Major ide5 57`
>
> For ide6 and ide7, how do I determine the Major numbers?
>
> Any help appreciated.
>
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | Assoc. Prof. Bruce C. Hewitson                  Ph: +27 21 650 2878 |
>  | Dept. Environmental & Geographical Sc.         Fax: +27 21 650 3791 |
>  | University of Cape Town, Private Bag, Rondebosch, South Africa 7701 |
>  |      hewitson@egs.uct.ac.za       http://www.egs.uct.ac.za/csag     |
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
