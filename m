Date: Thu, 24 Aug 2000 12:46:14 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM and sw RAID1
Message-ID: <20000824124613.B19952@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <20000823162957.B8398@gospelcom.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20000823162957.B8398@gospelcom.net>; from pcg@gospelcom.net on Wed, Aug 23, 2000 at 04:29:57PM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Wed, Aug 23, 2000 at 04:29:57PM -0400, Peter Green wrote:
> I am having a really difficult time being able to get LVM to recognize my
> /dev/md[012] arrays. The system:

hello you have stumbled upon a (nother) nice bug in lvm
i asked for help twice on this list, none helped even bothered to answer,
anyway i found the bug, well there is more than one preventing you to use
raid and LVM, fixed that and pvmoved everything onto my lvm+raid5 (fixing another bug
in the process).
Well, i discovered that reiserfs + LVM + raid DOES NOT WORK, it actually filled
95% of my files with zeroes :)

(*use the tape luke*)

unluckyli the patch to fix lvm+raid was not on tape, so i will post it as soon
i manage to rewrite it from memory,  hold your breath and mail me personally if
i forget :)

BTW i am back with ext2 and it works

Regards.
L.

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
