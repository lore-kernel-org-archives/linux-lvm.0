From: Alasdair G Kergon <agk@uk.sistina.com>
Message-ID: <20021118152231.A5567@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 Beta 4 available from ftp.sistina.com
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
Date: Mon Nov 18 09:23:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lvm-devel@sistina.com, linux-lvm@sistina.com

Summary of the main changes in Beta 4
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  New format of LVM metadata now ready for testing.
    Designed to improve efficiency and robustness and to 
    offer more options for recovery in the event of problems.

  New command line tool options to support the new metadata format.
    vgconvert to change a volume group from one format to another.
    pvremove to remove a physical volume from LVM's management.

  New configuration file options (see doc/example.conf).

  Updated manual pages explaining the new features.

  Improvements to the text archive file format to prepare for future 
  extensions.  (N.B. Partially incompatible with previous betas.)

  Framework to support additional metadata formats in shared libraries.

See the README, WHATS_NEW and INSTALL files for further information.


Tarballs are available from:
  ftp://ftp.sistina.com/pub/LVM2/tools/LVM2.1.95.11.tgz
The latest stable version of device-mapper is:
  ftp://ftp.sistina.com/pub/LVM2/device-mapper/device-mapper.0.96.06.tgz

To access the CVS tree use:
  cvs -d :pserver:cvs@tech.sistina.com:/data/cvs login
    CVS password: cvs1
  cvs -d :pserver:cvs@tech.sistina.com:/data/cvs checkout LVM2


Please use the LVM development mailing list to discuss these and
possible future changes:
  lvm-devel@sistina.com
  http://lists.sistina.com/mailman/listinfo/lvm-devel
 
Alasdair
-- 
agk@uk.sistina.com
