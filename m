Return-Path: <boutilpj@ednet.ns.ca>
Message-ID: <3B584260.6060204@ednet.ns.ca>
Date: Fri, 20 Jul 2001 11:38:24 -0300
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 2 LVM questions
References: <200107201334.QAA26563@easymail.hol.gr>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

What I would do is:

1. Create a Volume group using the 2 unused hard disks.
2. Create a file system on the new Logical volume
3. Copy your /var directory to the new filesystem mounted as /var2 
(shutdown Mysql first so the data is clean).
4. Move /var to /var3 (mv /var /var3)
5. Mount new file system as /var

When you are satisfied that everything is working on LVM fine you can 
then delete the partition that /var3 is on (old /var) and use it to 
extend your logical volume.



moka@hol.gr wrote:

>Hi there, new to LVM, so I would appreciate if you can 
>point me to answers to these questions:
>
>1) I have a system with 3 hard disks, and only one of 
>them is presently used. This contains boot, root and 
>swap plus a logical  partition(not LVM) containing
>/var and /home.
>
>I have big database tables, so I would like
> to create one volume group consisting of the 2
> unused disks plus the /var. Is this possible
> without losing what is in /var?
>2) The reason I need  a lot of space is that mysql
>  which I am using stores the database tables in /var.
> Can I somehow "name" the volume group /var
>  so that mysql will not be confused?
>
>Thanks in advance,
>S.Alexiou
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
