Message-Id: <200312100027.hBA0RHZ13777@mail.osdl.org>
From: markw@osdl.org
MIME-Version: 1.0
Subject: [linux-lvm] DBT-2 running against PostgreSQL and LVM2
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
Date: Tue Dec  9 18:28:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, pgsql-hackers@postgresql.org
Cc: osdldbt-general@lists.sourceforge.net, stp-devel@lists.sourceforge.net

I just wanted to share that we're on the brink of having an automated
test on our Scalable Test Platform (http://www.osdl.org/stp/) that
features our DBT-2 workload, a fair use implementation of the TPC-C,
that uses PostgreSQL 7.4 and LVM2 on Linux on our 8-processor systems.

Currently the test only works with a scale factor of 1 warehouse, which
amounts to about a 500MB of raw data.  You can request tests at this
scale factor at the above link and typing "-w 1" in the "Optional Script
Parameters" field.

We're working through some Linux kernel related issues so we can run
more interesting workloads against larger databases.  I'm planning to
allow an option for either a 100 and 200 warehouse database to be built.

I wanted to let people know early for feedback on the kind of data that
is reported from the test.  You can see a sample of a test report here:
	http://khack.osdl.org/stp/284353/

Thanks!
-- 
Mark Wong - - markw@osdl.org
Open Source Development Lab Inc - A non-profit corporation
12725 SW Millikan Way - Suite 400 - Beaverton, OR 97005
(503) 626-2455 x 32 (office)
(503) 626-2436      (fax)
http://developer.osdl.org/markw/
