Return-Path: <harvell@nortelnetworks.com>
Message-ID: <3B54F04E.4FEF132@americasm01.nt.com>
Date: Tue, 17 Jul 2001 21:11:26 -0500
From: "Joe Harvell" <harvell@nortelnetworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] how to deactivate vg hosting root filesystem
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

So I set up an initrd that starts raid and lvm before doing a pivot_root
and execing init.  This has been working fine for a long time.

The only problem I have is that the only way I know of to free up the vg
for deactivation is to make init exit, which panics the kernel.  How do
I do this safely?
