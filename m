Return-Path: <JSO@europay.com>
Message-ID: <A4A5E4C468B5D11190220001FA6835DD04DD889A@EPIXCH003>
From: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@EUROPAY.COM>
Date: Mon, 19 Mar 2001 12:03:25 +0100
MIME-Version: 1.0
Subject: [linux-lvm] lvm-0.9.1beta6 & kernel-2.4.2?
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

Continuing my investigation to build an all lvm boot disk, I implement
lvm-0.9.1beta6 on kernel-2.4.2.

Then I run lvmcreate_initrd but script hang on mount -o loop ... ?

As I do not use frequently loopback devices, I came back to 2.4.1 to test
with 0.9.1.beta5 first then with 0.9.1beta6. It works all fine .

Is something was broken in loopback device into 2.4.2 or do I have to use a
more recent release of 'mount' (dpkg shows me 2.10o)?

Thanks in advance for help?
	Joel



**********************************************************************
This e-mail and any attachments to it may contain confidential information which is strictly intended for the use of the authorised recipient.  If you have received this e-mail in error, please delete it and notify the sender by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
