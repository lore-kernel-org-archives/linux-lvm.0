From: "Timothy D. Witham" <wookie@osdl.org>
In-Reply-To: <200312100027.hBA0RHZ13777@mail.osdl.org>
References: <200312100027.hBA0RHZ13777@mail.osdl.org>
Message-Id: <1071187841.1313.74.camel@wookie-t23>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [Stp-devel] DBT-2 running against PostgreSQL and LVM2
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
Date: Fri Dec 12 09:05:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mark Wong <markw@osdl.org>
Cc: linux-lvm@sistina.com, pgsql-hackers@postgresql.org, osdldbt-general@lists.sourceforge.net, stp-devel@lists.sourceforge.net

  Thanks for getting this out.
Tim

On Tue, 2003-12-09 at 16:27, markw@osdl.org wrote:
> I just wanted to share that we're on the brink of having an automated
> test on our Scalable Test Platform (http://www.osdl.org/stp/) that
> features our DBT-2 workload, a fair use implementation of the TPC-C,
> that uses PostgreSQL 7.4 and LVM2 on Linux on our 8-processor systems.
> 
> Currently the test only works with a scale factor of 1 warehouse, which
> amounts to about a 500MB of raw data.  You can request tests at this
> scale factor at the above link and typing "-w 1" in the "Optional Script
> Parameters" field.
> 
> We're working through some Linux kernel related issues so we can run
> more interesting workloads against larger databases.  I'm planning to
> allow an option for either a 100 and 200 warehouse database to be built.
> 
> I wanted to let people know early for feedback on the kind of data that
> is reported from the test.  You can see a sample of a test report here:
> 	http://khack.osdl.org/stp/284353/
> 
> Thanks!
-- 
Timothy D. Witham - Lab Director - wookie@osdl.org
Open Source Development Lab Inc - A non-profit corporation
12725 SW Millikan Way - Suite 400 - Beaverton OR, 97005
(503)-626-2455 x11 (office)    (503)-702-2871     (cell)
(503)-626-2436     (fax)
