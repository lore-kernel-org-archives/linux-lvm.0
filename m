Message-ID: <3C04506F.6050603@larsshack.org>
From: Lars Kellogg-Stedman <lars@larsshack.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM tools RPM spec file for CVS builds
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
Date: Tue Nov 27 20:46:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

In case someone else finds it useful...

I've put an RPM spec file online at 
<http://larsshack.freeservers.com/lvm/> that will build the LVM user 
space tools using the current CVS tree.

The spec file attempts to be clever and doesn't actually do a full 
checkout for each build -- only the first one.  After that, it runs a 
cvs update.

For folks experiencing the "help, <insert-command-name-here> segfaults" 
problem, you can pass rpm the "--with kgcc" flag on RedHat systems with 
the kgcc package installed, which will result in a non-segfaulting build.

-- Lars
