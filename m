Message-ID: <3923FAAF.A3E2A2D3@netconnect.com.au>
Date: Fri, 19 May 2000 00:14:07 +1000
From: bug1 <bug1@netconnect.com.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How can activate the LVM in start
References: <00a201bfbe75$7395a020$4b1f04d5@migue> <20000515194742.A1442@home.ds9a.nl>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: bert hubert <ahu@ds9a.nl>
Cc: linux-lvm@msede.com

bert hubert wrote:
> 
> On Mon, May 15, 2000 at 03:57:02PM +0200, Miguel Angel wrote:
> 
> > When I restart de computer I have to execute "vgchange -a y " to activate
> > /dev/mi_vg . How can I activate it at the start ?
> 
> That's life, you need to activate it manually.
> 

Im no kernel hacker, but just wondering, would it be possible to get the
kernel to autodetect lvm partitions in a similar way that raid
autodetection works, or would it not be possible because of LVM's
userland tools.

Glenn
