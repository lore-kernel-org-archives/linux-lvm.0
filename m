Date: Sun, 22 Oct 2000 11:42:05 -0500 (CDT)
From: "Dominic J. Eidson" <sauron@the-infinite.org>
Subject: Re: [linux-lvm] Does anybody...
In-Reply-To: <00102023414400.17574@neumond>
Message-ID: <Pine.LNX.4.10.10010221138350.4934-100000@morannon.the-infinite.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM <linux-lvm@msede.com>

On Fri, 20 Oct 2000, Michael Muehrenberg wrote:

> Am Freitag, 20. Oktober 2000 23:39 schrieben Sie:
> > Have a short/quick howto on setting up booting off of an initrd to allow
> > the root filesystem (and others) to be on LVM?
> 
> It goes something like this:

[Snip explanation]

Thanks, it worked:

solo:~ # df
Filesystem            1k-blocks      Used Available Use% Mounted on
/dev/rootvg/rootlv       198337    178327      9770  95% /
/dev/rootvg/usrlv       1032088    628300    351360  64% /usr
/dev/hda1                 21219      4524     15563  23% /boot
/dev/rootvg/homelv      1862694       280   1767708   0% /home

:-)


-- 
Dominic J. Eidson
                                        "Baruk Khazad! Khazad ai-menu!" - Gimli
-------------------------------------------------------------------------------
http://www.the-infinite.org/              http://www.the-infinite.org/~dominic/
