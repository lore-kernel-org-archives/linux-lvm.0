From: Alasdair G Kergon <agk@uk.sistina.com>
Message-ID: <20030706021224.A19265@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Updated LVM2 tools for testing
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
Date: Sat Jul  5 20:13:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I've put updated versions of the LVM2 tools from CVS onto the FTP site
so more people can test them.  The kernel driver has been improved.

dmsetup + libdevmapper + replacement kernel patches for 2.4.20 & 2.4.21:
  ftp://ftp.sistina.com/pub/LVM2/device-mapper/device-mapper-testing-new-version4-interface.tgz

Updated LVM2 tools to work with the above:
  ftp://ftp.sistina.com/pub/LVM2/tools/LVM2.0-testing.tgz

If the new tools detect the old version 1 driver, they try to fall back
and use the old API, so you shouldn't need to keep two sets of tools
around if you're regularly swapping kernels.  [But this hasn't been
thoroughly tested.]

Alasdair
-- 
agk@uk.sistina.com
