Message-ID: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560CD9@s99mail06>
From: "Little, Chris" <Chris.Little@okdhs.org>
Subject: RE: [linux-lvm] bug report
MIME-Version: 1.0
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
Date: Mon Dec  1 22:32:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

yes.  the database is closed when running the snapshot.

-----Original Message-----
From: David Johnston [mailto:david@littlebald.com]
Sent: Monday, December 01, 2003 8:10 PM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] bug report


On Mon, 2003-12-01 at 18:39, Little, Chris wrote:
> who would i address a bug report to?  we have a reproducible issue with
lvm.
> using -s with lvcreate results in a corrupt oracle database.

Just out of curiousity, are you running the appropriate commands to
cause Oracle to quiesce/close the database?


-- 
David Johnston <david@littlebald.com>
Little Bald Consulting, LLC

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
