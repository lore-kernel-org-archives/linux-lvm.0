Return-Path: <falcon_lvm@yahoo.com>
Message-ID: <004801c0aa71$83d0cee0$17b898c1@mshome.net>
From: "Falcon" <falcon_lvm@yahoo.com>
References: <200103081646.f28Gkhx04645@webber.adilger.net> <3AA8DA59.31A90AE1@mbsmm.com>
Subject: Re: [linux-lvm] EXT2-fs panic (device lvm(58,0)):
Date: Sun, 11 Mar 2001 22:23:26 +0100
MIME-Version: 1.0
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

    I have the same problem , and I don't have IBM Raid . I decide to create
the first lv with 1Mega and ignote it before to create the rest of lv's . I
don't know where is the problem , perhaps in the "mount" or "lvcreate" ?


----- Original Message -----
From: "Bill Clark" <bill@mbsmm.com>
To: <linux-lvm@sistina.com>
Sent: Friday, March 09, 2001 2:27 PM
Subject: Re: [linux-lvm] EXT2-fs panic (device lvm(58,0)):


>
> Just to officially close this out, the problem was traced back to the
> IBM ServerRAID card.
>
> Thanx for all your help.
>
> Bill
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm


_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com
