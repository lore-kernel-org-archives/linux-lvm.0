Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1NHgsi18576
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2004 12:42:54 -0500
Received: from mail.osdl.org (fw.osdl.org [65.172.181.6])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1NHgrb23613
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2004 12:42:53 -0500
Message-Id: <200402231742.i1NHgcE17332@mail.osdl.org>
From: markw@osdl.org
MIME-Version: 1.0
Subject: [linux-lvm] (no subject)
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Feb 23 12:41:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pgsql-hackers@postgresql.org
Cc: linux-kernel@vger.kernel.org, linux-lvm@redhat.com, osdldbt-general@lists.sourceforge.net

http://developer.osdl.org/markw/ia64/dbt2/

I have a summary of intial results from our DBT-2 workload with
PostgreSQL 7.4.1 on a 4-way Itanium2 system with 16GB of memory and 56
drives using LVM2 and linux-2.6.3.  There's readprofile
and oprofile data, but oprofile is seg faulting when it's trying to
generate the annotated assembly source.

I'm still trying to get a feel for how large of a database I can run
with it, but I wanted to share what I've got so far.  It looks like I
have quite a bit of unused system resources, so I probably have to tune
the database and perhaps how I'm driving the load a bit.

Let me know if there are any questions.

-- 
Mark Wong - - markw@osdl.org
Open Source Development Lab Inc - A non-profit corporation
12725 SW Millikan Way - Suite 400 - Beaverton, OR 97005
(503) 626-2455 x 32 (office)
(503) 626-2436      (fax)
http://developer.osdl.org/markw/
