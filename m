Return-Path: <nobody@easymail.hol.gr>
Date: Fri, 20 Jul 2001 16:34:15 +0300
Message-Id: <200107201334.QAA26563@easymail.hol.gr>
From: moka@hol.gr
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] 2 LVM questions
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

Hi there, new to LVM, so I would appreciate if you can 
point me to answers to these questions:

1) I have a system with 3 hard disks, and only one of 
them is presently used. This contains boot, root and 
swap plus a logical  partition(not LVM) containing
/var and /home.

I have big database tables, so I would like
 to create one volume group consisting of the 2
 unused disks plus the /var. Is this possible
 without losing what is in /var?
2) The reason I need  a lot of space is that mysql
  which I am using stores the database tables in /var.
 Can I somehow "name" the volume group /var
  so that mysql will not be confused?

Thanks in advance,
S.Alexiou
