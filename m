Return-Path: <Dominique.Larchey-Wendling@loria.fr>
Message-ID: <3AEED728.75329DD2@loria.fr>
Date: Tue, 01 May 2001 17:32:56 +0200
From: Dominique LARCHEY-WENDLING <Dominique.Larchey-Wendling@loria.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM & high system load
References: <3AEEAEAA.93304CBB@loria.fr>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Dominique LARCHEY-WENDLING wrote:


> relatively poor IO perf. (my cpu is only PII 333) on LVM volumes. I have
> tested reiserfs and ext2fs and I only get about 2.5Mb/s with 100% CPU
> load,
> mostly system time.

More over, doing a CPU intensive task (like kernel comp.) (not involving
LVM, the
sources are not on a LV) cut the IO perf. of LVM fs by half.

So it seems that the LVM is eating a lot of CPU on my system and this is
what is limiting fs perf.

DL

-- 
Dominique Larchey
LORIA, Nancy, France
Tel. (Work) +33 (0) 3 83 59 20 13
