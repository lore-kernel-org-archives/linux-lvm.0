Date: Thu, 26 Aug 1999 11:37:12 -0500 (CDT)
From: "Jonny B." <brassow@lcse.umn.edu>
Subject: [linux-lvm] e2fsadm Q's
Message-ID: <Pine.SGI.3.91.990826112146.14438A-100000@nile.lcse.umn.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I see that in order to resize ext2 file systems, you need this 
"resize2fs" tool.  However, you need to have registered PartitionMagic 
3.x in order to download it.

So, I'm thinking that this product is probably not open source.  If I'm 
wrong (or I can get a developement version of some source code 
somewhere), could someone please tell me?

The reason I'm asking is because I am going to start work on a file 
system resizer for GFS.  I would like it to be an online resizer (mmm... 
lots of problems:).  Does anyone have any experience in this or could 
point me to some source code (other than the LVM stuff - I'm looking that 
over now:)?

 brassow

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
There are more than 1,000 chemicals in coffee; of those, 26 have
been tested, of the 26, 1/2 cause cancer in laboratory rats.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
