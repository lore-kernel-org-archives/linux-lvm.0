Received: from amote.csb (ashishks.pnq.redhat.com [10.65.0.178])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n069I9Fg010055
	for <linux-lvm@redhat.com>; Tue, 6 Jan 2009 04:18:10 -0500
Message-ID: <496321D1.5050102@redhat.com>
Date: Tue, 06 Jan 2009 14:48:09 +0530
From: Ajit Mote <amote@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Logical volume contains an incomplete mapping table
Reply-To: amote@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello,

Initially  installed machine is RHEL3 with LVM  then installed RHEL4 U6 
and trying to access LVM (which were available in RHEL3).

After executing vgscan , getting following errors :
  Reading all physical volumes.  This may take a while...
  Found duplicate PV hk255uVUz6FaIcZidRLotgRQ4iYvVJ7x: using 
/dev/emcpowerag not /dev/sdq
  /dev/sds: read failed after 0 of 4096 at 0: Input/output error
  /dev/sds: read failed after 0 of 4096 at 1073676288: Input/output error
  /dev/sds: read failed after 0 of 4096 at 0: Input/output error
  Found duplicate PV MaBySYaqMiJnOpZjiToOxOjsy3A3goU3: using 
/dev/emcpowerai not /dev/sday
  Found duplicate PV tX8c8WE9celz8GkAO1zmKSVNuvlvE7u0: using /dev/sdd 
not /dev/sdaw
  Found duplicate PV gcySABZ3n0iyMyIRIXiukYaMhRFKK3OG: using /dev/sde 
not /dev/sdax
  Found duplicate PV CWyb0xFUD44n672EejT6kwsYIAv9ad7K: using /dev/sdba 
not /dev/emcpowerah
  Found duplicate PV MaBySYaqMiJnOpZjiToOxOjsy3A3goU3: using /dev/sdf 
not /dev/emcpowerai
  Found duplicate PV hk255uVUz6FaIcZidRLotgRQ4iYvVJ7x: using /dev/sdbb 
not /dev/emcpowerag
  Found duplicate PV 8TYowYcRjvC7da017w4b0WLKSNavfRcY: using /dev/sdg 
not /dev/sdaz
  Found duplicate PV MtmaHFD0BMgJzLm3FQG0iz0WXUTSrKl8: using /dev/sdbc 
not /dev/sdb
  Found duplicate PV CWyb0xFUD44n672EejT6kwsYIAv9ad7K: using /dev/sdh 
not /dev/sdba
  Found duplicate PV HGGFOVxr4AlRsoW4s58qkmfqFIUBpDzc: using /dev/sdbd 
not /dev/sdc
  Found duplicate PV hk255uVUz6FaIcZidRLotgRQ4iYvVJ7x: using /dev/sdi 
not /dev/sdbb
  Found duplicate PV tX8c8WE9celz8GkAO1zmKSVNuvlvE7u0: using /dev/sdbe 
not /dev/sdd
  Found duplicate PV MtmaHFD0BMgJzLm3FQG0iz0WXUTSrKl8: using /dev/sdj 
not /dev/sdbc
  Found duplicate PV gcySABZ3n0iyMyIRIXiukYaMhRFKK3OG: using /dev/sdbf 
not /dev/sde
  Found duplicate PV HGGFOVxr4AlRsoW4s58qkmfqFIUBpDzc: using /dev/sdk 
not /dev/sdbd
  Found duplicate PV MaBySYaqMiJnOpZjiToOxOjsy3A3goU3: using /dev/sdbg 
not /dev/sdf
  Found duplicate PV tX8c8WE9celz8GkAO1zmKSVNuvlvE7u0: using /dev/sdl 
not /dev/sdbe
  Found duplicate PV 8TYowYcRjvC7da017w4b0WLKSNavfRcY: using /dev/sdbh 
not /dev/sdg
  Found duplicate PV tX8c8WE9celz8GkAO1zmKSVNuvlvE7u0: using 
/dev/emcpowerab not /dev/sdl
  Found duplicate PV gcySABZ3n0iyMyIRIXiukYaMhRFKK3OG: using /dev/sdm 
not /dev/sdbf
  Found duplicate PV CWyb0xFUD44n672EejT6kwsYIAv9ad7K: using /dev/sdbi 
not /dev/sdh
  Found duplicate PV MtmaHFD0BMgJzLm3FQG0iz0WXUTSrKl8: using 
/dev/emcpowerac not /dev/sdj
  Found duplicate PV MaBySYaqMiJnOpZjiToOxOjsy3A3goU3: using /dev/sdn 
not /dev/sdbg
  Found duplicate PV hk255uVUz6FaIcZidRLotgRQ4iYvVJ7x: using /dev/sdbj 
not /dev/sdi
  Found duplicate PV 8TYowYcRjvC7da017w4b0WLKSNavfRcY: using 
/dev/emcpowerad not /dev/sdbh
  Found duplicate PV 8TYowYcRjvC7da017w4b0WLKSNavfRcY: using /dev/sdo 
not /dev/emcpowerad
  Found duplicate PV MtmaHFD0BMgJzLm3FQG0iz0WXUTSrKl8: using /dev/sdau 
not /dev/emcpowerac
  Found duplicate PV gcySABZ3n0iyMyIRIXiukYaMhRFKK3OG: using 
/dev/emcpowerae not /dev/sdm
  Found duplicate PV CWyb0xFUD44n672EejT6kwsYIAv9ad7K: using /dev/sdp 
not /dev/sdbi
  Found duplicate PV HGGFOVxr4AlRsoW4s58qkmfqFIUBpDzc: using /dev/sdav 
not /dev/sdk
  Found duplicate PV HGGFOVxr4AlRsoW4s58qkmfqFIUBpDzc: using 
/dev/emcpoweraf not /dev/sdav
  Found volume group "linux_vg0" using metadata type lvm1
  Logical volume (db_files) contains an incomplete mapping table.
  Found duplicate PV hk255uVUz6FaIcZidRLotgRQ4iYvVJ7x: using /dev/sdq 
not /dev/sdbj
  Found duplicate PV tX8c8WE9celz8GkAO1zmKSVNuvlvE7u0: using /dev/sdaw 
not /dev/emcpowerab
  Found duplicate PV hk255uVUz6FaIcZidRLotgRQ4iYvVJ7x: using 
/dev/emcpowerag not /dev/sdq
  Found duplicate PV MtmaHFD0BMgJzLm3FQG0iz0WXUTSrKl8: using /dev/sdb 
not /dev/sdau
  Found duplicate PV gcySABZ3n0iyMyIRIXiukYaMhRFKK3OG: using /dev/sdax 
not /dev/emcpowerae
  Found duplicate PV CWyb0xFUD44n672EejT6kwsYIAv9ad7K: using 
/dev/emcpowerah not /dev/sdp
  Found duplicate PV HGGFOVxr4AlRsoW4s58qkmfqFIUBpDzc: using /dev/sdc 
not /dev/emcpoweraf
  /dev/sds: read failed after 0 of 4096 at 0: Input/output error
  Found duplicate PV MaBySYaqMiJnOpZjiToOxOjsy3A3goU3: using /dev/sday 
not /dev/sdn
  Found duplicate PV MaBySYaqMiJnOpZjiToOxOjsy3A3goU3: using 
/dev/emcpowerai not /dev/sday
  Found duplicate PV tX8c8WE9celz8GkAO1zmKSVNuvlvE7u0: using /dev/sdd 
not /dev/sdaw
  Found duplicate PV 8TYowYcRjvC7da017w4b0WLKSNavfRcY: using /dev/sdaz 
not /dev/sdo
  Found duplicate PV gcySABZ3n0iyMyIRIXiukYaMhRFKK3OG: using /dev/sde 
not /dev/sdax
  Found duplicate PV CWyb0xFUD44n672EejT6kwsYIAv9ad7K: using /dev/sdba 
not /dev/emcpowerah
  Found duplicate PV MaBySYaqMiJnOpZjiToOxOjsy3A3goU3: using /dev/sdf 
not /dev/emcpowerai
  Found duplicate PV hk255uVUz6FaIcZidRLotgRQ4iYvVJ7x: using /dev/sdbb 
not /dev/emcpowerag
  Found duplicate PV 8TYowYcRjvC7da017w4b0WLKSNavfRcY: using /dev/sdg 
not /dev/sdaz
  Found duplicate PV MtmaHFD0BMgJzLm3FQG0iz0WXUTSrKl8: using /dev/sdbc 
not /dev/sdb
  Found duplicate PV CWyb0xFUD44n672EejT6kwsYIAv9ad7K: using /dev/sdh 
not /dev/sdba
  Found duplicate PV HGGFOVxr4AlRsoW4s58qkmfqFIUBpDzc: using /dev/sdbd 
not /dev/sdc
  Found duplicate PV hk255uVUz6FaIcZidRLotgRQ4iYvVJ7x: using /dev/sdi 
not /dev/sdbb
  Found duplicate PV tX8c8WE9celz8GkAO1zmKSVNuvlvE7u0: using /dev/sdbe 
not /dev/sdd
  Found duplicate PV MtmaHFD0BMgJzLm3FQG0iz0WXUTSrKl8: using /dev/sdj 
not /dev/sdbc
  Found duplicate PV gcySABZ3n0iyMyIRIXiukYaMhRFKK3OG: using /dev/sdbf 
not /dev/sde
  Found duplicate PV HGGFOVxr4AlRsoW4s58qkmfqFIUBpDzc: using /dev/sdk 
not /dev/sdbd
  Found duplicate PV MaBySYaqMiJnOpZjiToOxOjsy3A3goU3: using /dev/sdbg 
not /dev/sdf
  Found duplicate PV tX8c8WE9celz8GkAO1zmKSVNuvlvE7u0: using /dev/sdl 
not /dev/sdbe
  Found duplicate PV 8TYowYcRjvC7da017w4b0WLKSNavfRcY: using /dev/sdbh 
not /dev/sdg
  Found duplicate PV tX8c8WE9celz8GkAO1zmKSVNuvlvE7u0: using 
/dev/emcpowerab not /dev/sdl
  Found duplicate PV gcySABZ3n0iyMyIRIXiukYaMhRFKK3OG: using /dev/sdm 
not /dev/sdbf
  Found duplicate PV CWyb0xFUD44n672EejT6kwsYIAv9ad7K: using /dev/sdbi 
not /dev/sdh
  Found duplicate PV MtmaHFD0BMgJzLm3FQG0iz0WXUTSrKl8: using 
/dev/emcpowerac not /dev/sdj
  Found duplicate PV MaBySYaqMiJnOpZjiToOxOjsy3A3goU3: using /dev/sdn 
not /dev/sdbg
  Found duplicate PV hk255uVUz6FaIcZidRLotgRQ4iYvVJ7x: using /dev/sdbj 
not /dev/sdi
  Found duplicate PV 8TYowYcRjvC7da017w4b0WLKSNavfRcY: using 
/dev/emcpowerad not /dev/sdbh
  Found duplicate PV 8TYowYcRjvC7da017w4b0WLKSNavfRcY: using /dev/sdo 
not /dev/emcpowerad
  Found duplicate PV MtmaHFD0BMgJzLm3FQG0iz0WXUTSrKl8: using /dev/sdau 
not /dev/emcpowerac
  Found duplicate PV gcySABZ3n0iyMyIRIXiukYaMhRFKK3OG: using 
/dev/emcpowerae not /dev/sdm
  Found duplicate PV CWyb0xFUD44n672EejT6kwsYIAv9ad7K: using /dev/sdp 
not /dev/sdbi
  Found duplicate PV HGGFOVxr4AlRsoW4s58qkmfqFIUBpDzc: using /dev/sdav 
not /dev/sdk
  Found duplicate PV HGGFOVxr4AlRsoW4s58qkmfqFIUBpDzc: using 
/dev/emcpoweraf not /dev/sdav
  Logical volume (db_files) contains an incomplete mapping table.
  Volume group "presale_copy_vg0" not found

Kindly suggest what this error is and how to recover LVM in RHEL4 U6.

Thanks & Regards,
Ajit Mote
