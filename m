Return-Path: <jan.w@lzer.net>
Date: Mon, 8 Jan 2001 14:10:26 +0100
From: Jan Walzer <jan.w@lzer.net>
Message-ID: <1504018708.20010108141026@lzer.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Once again ... Kernel 2.4.0 - What can I do ?
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

Hello List,

  I'm currently using Kernel 2.4.0-test10 with LVM 0.8final ...
  I have a 55Gig LVM-Partition (with reiserfs) and no backup ....
  (Yes I know, but there's no money for a poor student to backup ...)

  Now I want to use the final 2.4.0 and it is now a fact, that there
  is v0.9 in it. (why it is, is another question...)

  I ask now, what I can do ...
  It seems that they both are not compatible, as the vgscan under
  2.4.0fin brings me a protocol error ...

  Is there a way to "downpatch" the kernel to lvm0.8 ???
  or better:
  can I convert the volume to 0.9 without data-loss ???

Thanx in advance ... Jan

  PS: Please don't tell me all the reasons, why I need a backup.
      I know it myself, but there is at the moment no way ....

-- 

 ,',    Jan Walzer      \V/  http://wa.lzer.net     ,',
',','   student of      >|<  mailto:jan.w@lzer.net ',','
  '   ComputerScience   /A\  +49-177-7403863         '
