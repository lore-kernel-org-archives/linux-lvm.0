Return-Path: <declerck@sistina.com>
Date: Sun, 07 Jan 2001 11:35:37 -0800
From: "Michael J. Declerck" <declerck@sistina.com>
Message-Id: <20010107193537.B3080E0B7@wraith>
Subject: [linux-lvm] Clarification concerning the status of LVM and 2.4
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

There has been a fair amount of traffic on the list concerning how LVM
0.9 was introduced in the 2.4 kernel from a number of individuals.
Unfortunately, I don't believe that a single message contains all the
facts concerning that introduction nor what the current path forward for
LVM 0.9 is.  This message is an attempt at doing that.

  The LVM 0.9 patch that was integrated into the 2.4 kernel was not
  provided by, reviewed by, or recommened by the LVM development team.
  The patch in its current incarnation has its birth in the 0.9 patch for
  2.4.0-test?? from the LVM CVS repository with modifications by individuals
  outside of the LVM development team.  This patch was submitted to Linus
  without review from the LVM maintainer or the LVM community at large.

  Due to the fact that this patch was not reviewed or vetted there have been
  a number of issues that have arisen concerning the operability of LVM 0.9
  on the 2.4.X series of kernels.

  The LVM development team is currently collecting patches and fixes for
  identified bugs and preparing a patch that can applied to 2.4.0.  This
  patch should correct the deficiencies that have been reported to date.

  The submitted patch will most likely be called LVM 0.91 and will have only
  minimal testing with regards to large and/or complex environments.  As
  such, individuals should take appropriate precautions to insure the
  integrity of their data before integration and testing of this patch.

---
Michael Declerck,  declerck@sistina.com  +1.510.823.7991
