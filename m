Date: Wed, 1 Aug 2012 13:24:13 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20120801122413.GF11876@agk-dp.fab.redhat.com>
References: <1912398.2IYGSI2Xbi@bursa22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1912398.2IYGSI2Xbi@bursa22>
Subject: Re: [linux-lvm] [lvm2cmd] Heap destruction by lvm2_exit()?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hubert Kario <hubert@kario.pl>
Cc: linux-lvm@redhat.com

Your test program works for me:

$ valgrind ./a.out
==14092== Memcheck, a memory error detector
==14092== Copyright (C) 2002-2009, and GNU GPL'd, by Julian Seward et al.
==14092== Using Valgrind-3.5.0 and LibVEX; rerun with -h for copyright info
==14092== Command: ./a.out
==14092== 
Some text to output
Variable before: "Other text"
Variable after: "Other text"
==14092== 
==14092== HEAP SUMMARY:
==14092==     in use at exit: 0 bytes in 0 blocks
==14092==   total heap usage: 161 allocs, 161 frees, 10,620,400 bytes allocated
==14092== 
==14092== All heap blocks were freed -- no leaks are possible
==14092== 
==14092== For counts of detected and suppressed errors, rerun with: -v
==14092== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 6 from 6)

What version of lvm2 are you using?
Retest with upstream source?
What lvm configure options are you using?

Alasdair
