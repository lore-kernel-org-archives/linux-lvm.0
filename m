Return-Path: <dick@britain.agilent.com>
Date: Thu, 10 May 2001 10:34:29 +0100 (BST)
From: Dick Middleton <dick@britain.agilent.com>
Message-Id: <200105100934.KAA02701@queeg.britain.agilent.com>
In-reply-to: Dick Middleton's message of Fri, 4 May 2001 09:06:24 +0100 (BST) <200105040806.JAA04384@queeg.britain.agilent.com>
Subject: [linux-lvm] Follow-up: Patching 2.2.18 with lvm + sw raid
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

re: installing (new) raid + lvm on 2.2.18.

>  >  Please follow the instructions re. software raid in LVM/PATCHES/README.

>  >  If you wish to use 'new raid' you will have to edit the fragments
>  >  file.  The patch will only apply to a specific version of new raid

I applied patches as instructions and it patched and compiled without error.
However the resulting kernel does not boot.  As far as I can tell it gets
stuck somewhere in the raid code.  It just hangs. This happens even if LVM is
deselected in kernel config.

I used LVM:   0.9.1_beta7
       Raid:  raid-2.2.18-B0
       Linux: 2.2.18

I did not find any useful error messages.

I decided to use LVM beta6 instead; that patches OK and it boots and runs
just fine.

Dick
