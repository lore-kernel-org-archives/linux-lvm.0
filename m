Message-ID: <EA753F4887A6ED449866D7F307ABBFDB4DB73C@mailserver.e-r-solutions.com>
From: ERG@e-r-solutions.com
Subject: RE: [linux-lvm] Error - "device-mapper: request is larger than bl
	ock size b_size"
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
Date: Tue Aug 20 19:59:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Joe Thornber said:
> If you are using xfs please be aware that you will need to use the new
> journal log format to avoid misalignment problems (search this list
> for previous posts).

OK, I've read up on the linux-lvm & linux-xfs mailing lists about the
introduction of XFS' version 2 log format on 6/18/02.  I'm just a little
slow, and I'm uncertain about how I need to set up the FS to avoid the
misalignment problems Joe mentioned.  Feel free to flame me if I should've
posted to linux-xfs, instead.

Will the following work:
mkfs -t xfs /dev/vg0/lv0 -l internal,version=2,sunit=1
If not, does anyone have an example 'mkfs.xfs -l version=2,su=X' command
that would give me a filesystem with the appropriate alignment?  

From man mkfs.xfs:
              The sunit suboption specifies the alignment  to  be
              used for log writes.  The suboption value has to be
              specified in 512-byte block units.  Use the su sub-
              option  to  specify  the  log  stripe  unit size in
              bytes.  Log writes will be aligned on  this  bound-
              ary,  and  rounded up to this boundary.  This gives
              major improvements in performance on some  configu-
              rations  such  as  software raid5 when the sunit is
              specified as the filesystem block size.  The equiv-
              alent byte value must be a multiple of the filesys-
              tem block size.  Version 2 logs  are  automatically
              selected if the log su suboption is specified.

With un-striped LVs, should I align my log, or stripe it?  And to what
multiple of 512-byte blocks?

Thanks a bunch,

Manuel Gomez
