Return-Path: <jdiehl@sandia.gov>
Message-ID: <B51F0C636E578A4E832D3958690CD73E0130BFC0@es04snlnt>
From: "Diehl, Jeffrey" <jdiehl@sandia.gov>
Date: Tue, 14 Aug 2001 14:52:17 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Renumbered drives hosed VG.
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>
Cc: "Diehl, Jeffrey" <jdiehl@sandia.gov>

Hi all,

I recently upgraded from a modular kernel to a monolithic kernel, which
renumbered all of my drives.  sda became sdb, sdb became sdc and adc became
sda, etc.  Now one of my VG's is hosed.  How do I recover from this?

Thanx,
Mike Diehl,
Network Monitoring Tool Devl.
284-3137
jdiehl@sandia.gov
