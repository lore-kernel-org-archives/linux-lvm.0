From: "Steven Stillaway" <steve@stillaway.net>
Message-ID: <20021011092455.GA5529@sparcbox.net>
References: <1034276879.2396.11.camel@mars.goatskin.org> <20021011075220.GA1153@fib011235813.fsnet.co.uk> <20021011090446.GA5506@sparcbox.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021011090446.GA5506@sparcbox.net>
Subject: [linux-lvm] device-mapper & proc
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
Date: Fri Oct 11 04:25:12 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

LVM has /proc/lvm, DM does not seem to have anything
equivalent.

Is there a reason for this?

Is this likely to change?

I ask because my start scripts look for /proc/lvm --
if I could have them check for /pro/lvm or /proc/dm
and run the appropriate command that would be useful.

Also I imagine a /proc/dm could be usefull for other
things.


-- 
Steven Stillaway
steve@stillaway.net
