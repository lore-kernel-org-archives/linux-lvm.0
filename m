Return-Path: <bs@infologic.fr>
Message-ID: <3A6E92DA.1A0DC5C5@infologic.fr>
Date: Wed, 24 Jan 2001 09:31:22 +0100
From: Benoit SERRA <bs@infologic.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Fwd: 2.4.0 kernel doesn't see LVM
References: <20010124184810.R715@ist.flinders.edu.au>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Mark Phillips wrote:
> 
> Hi,
> 
> I am currently running a 2.4.0-test9 kernel with LVM compiled in and
> with associated software, version 0.8.final.  Everything works fine
> here.
> 
> I tried compiling the final version of 2.4.0 with LVM compiled in, but
> when I tried booting, it complained that it didn't know about my LVM
> devices!  It seems strange that 2.4.0-test9 works fine but 2.4.0
> doesn't.  Could it be that I need to upgrade to 0.9 of the LVM
> software?
> 

With 2.4.0, the LVM version is 0.9, which is not compatible with 0.8.
So you have to upgrade your user space tools to 0.9, and to migrate your
0.8final LVM volumes to 0.9
volumes. For me, the safiest way to do this is to make a backup of your
data, crash all your LVm setup, reboot on 2.4.0, create your VG and LV
with  0.9 user space tools, and then restore data.
I think there is some way to migrate without restoring data, check the
list archive for this.
