Return-Path: <Fionn.Behrens@unix-ag.org>
Message-ID: <XFMail.20001219212422.fionn@unix-ag.org>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
In-Reply-To: <200012171800.eBHI0J129132@webber.adilger.net>
Date: Tue, 19 Dec 2000 21:24:22 +0100 (CET)
From: Fionn Behrens <Fionn.Behrens@unix-ag.org>
Subject: Re: [linux-lvm] Debian packaging
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

Hi Andreas Dilger,

on 17-Dec-2000 you wrote:
 
>> I was thinking that perhaps what I should do is have /sbin/lvm-ver and 
>> /lib/lvm-ver directories where "ver" is the version of LVM in question.
>> Then at boot time there is a script that determines the version of LVM in
>> the 
>> kernel and creates sym-links from /sbin and /lib to the correct
>> directories.  
> 
> Think PATH - this is really easy, and shells already support it.  No more
> work to be done, and it's not ugly.  The IOP version will probably never
> change within a boot (unless LVM is a module and it gets upgraded without
> upgrading the kernel - unlikely).

Shouldnt the debian alternatives mechanism (see "man 8 update-alternatives")
be most appropriate for this task?

Regards,
        Fionn
