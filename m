Message-Id: <200312261919.hBQJJOM00527@mail.osdl.org>
From: markw@osdl.org
MIME-Version: 1.0
Subject: [linux-lvm] DBT-2 PostgreSQL on STP w/ LVM2
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
Date: Fri Dec 26 13:21:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, stp-devel@lists.sourceforge.net, linux-lvm@sistina.com, osdldbt-general@lists.sourceforge.net, pgsql-hackers@postgresql.org

DBT-2 and PostgreSQL 7.4 is finally working with LVM2 at 100 and 200
warehouse scale factors on 8-processor system in STP with 40 drives (38
managed under LVM), but not without a few catches. I have written up
some brief instructions on how to execute the test successfully with the
Linux-2.6.0 stable release:
	http://developer.osdl.org/markw/stp_dbt2_howto.html

The instructions also cover how to get oprofile annoted assembly source
in the test results.  Feel free to ask any questions.
-- 
Mark Wong - - markw@osdl.org
Open Source Development Lab Inc - A non-profit corporation
12725 SW Millikan Way - Suite 400 - Beaverton, OR 97005
(503) 626-2455 x 32 (office)
(503) 626-2436      (fax)
http://developer.osdl.org/markw/
