Return-Path: <raheesom@navpoint.com>
Message-Id: <200104171821.f3HILdS05714@west.navpoint.com>
Subject: Re: Re: [linux-lvm] CDRECORD not working when LVM loaded.
From: Rupert Heesom <raheesom@navpoint.com>
Date: 17 Apr 2001 13:13:57 -0400
Mime-Version: 1.0
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
To: linux-lvm@sistina.com

Well, gentlemen; I found out what the problem was .... nothing to do with LVM.

I was trying to run "cdrecord --scanbus" without the correct
permissions.  "cdrecord" was set to root permissions.  So, I've set the
UID & GID on CDRECORD.  Now works fine when logged in as myself.

Previously, I must have tried CDRECORD as myself, found it didn't work.
SUed to root to unload the LVM module, then run CDRECORD whilst still
logged in as root.  Of course it worked.

Well, on with LVM then !!!


-- 
regs
rupert
