Date: Thu, 9 Mar 2000 22:39:33 +0200 (SAST)
From: Bruce Hewitson <hewitson@egs.uct.ac.za>
Subject: Re: [linux-lvm] 12 disks -- new problems ....
In-Reply-To: <Pine.LNX.4.10.10003092129410.22470-100000@tie.egs.uct.ac.za>
Message-ID: <Pine.LNX.4.10.10003092237070.23268-100000@tie.egs.uct.ac.za>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


Answering my own message -- seems that there must be something in LVM that
only looks at ide0 - ide5 -- I found the latest version of hdparm which
goes up to ide9.

So -- does anybody know how to patch lvm to look at least as far as ide7?

thanks


 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 | Assoc. Prof. Bruce C. Hewitson                  Ph: +27 21 650 2878 |
 | Dept. Environmental & Geographical Sc.         Fax: +27 21 650 3791 |
 | University of Cape Town, Private Bag, Rondebosch, South Africa 7701 |
 |      hewitson@egs.uct.ac.za       http://www.egs.uct.ac.za/csag     |
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
