Return-Path: <JSO@europay.com>
Message-ID: <A4A5E4C468B5D11190220001FA6835DD04DD8945@EPIXCH003>
From: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@EUROPAY.COM>
Date: Tue, 29 May 2001 14:50:10 +0200
MIME-Version: 1.0
Subject: [linux-lvm] lvm root fs + lilo patch: boot problem
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
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hello all,

I still try to work on a full lvm disk config (a la HP) (as many). 
(with kernel-2.4.1 + lvm-0.9.1beta6)

In your mailing-list, I find well a patch for lilo.
Nice but the most difficult was to find back the matching sources!
I finally find something near the request. Then compile it and install it on
my scsi disk.
Then try a reboot but LILO just show 'LI' then hang. I also re-install it
but same problem.
Any idea of the source of the problem (Bad patch application? scsi adapter
unsupported?)

I also try to apply the grub-patch after retrieving the source with cvs
But no success? Is any work on this idea?

 Thanks in advance for info,

	Joel


**********************************************************************
This e-mail and any attachments to it may contain confidential information which is strictly intended for the use of the authorised recipient.  If you have received this e-mail in error, please delete it and notify the sender by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
