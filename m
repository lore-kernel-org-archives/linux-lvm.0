Message-ID: <20020605113818.D8251@yukon.drivingbeat.com>
Mime-Version: 1.0
Content-Disposition: inline
From: "Jason C. Leach" <jleach@mail.ocis.net>
Subject: [linux-lvm] LV not mounting from fstab.
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
Date: Wed Jun  5 13:38:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

hi,

When I boot my system ( a test box ) the VG always are not active. I must do:
vgchange -a y test

then I can mount it.

Any reason for this?  Perhaps because I have the lvm mod v1.0.1 in kernel 2.4.18, and
am using the 1.0.4 tools?

Thanks,
j.

-- 
......................
..... Jason C. Leach
.. 

Current PGP/GPG Key ID: 43AD2024 
