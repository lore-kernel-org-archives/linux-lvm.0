Message-Id: <5.2.0.9.2.20030710233915.03308cf8@pop.tvnet.hu>
From: Newsmail <newsmail@satimex.tvnet.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] pvmove and badsectors
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
Date: Thu Jul 10 17:07:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

-i, --ignore_read_errors
        Ignore read errors while moving data. Usefull in case data is moved=
=20
away from a  broken  or  unac=AD
        cessable disk (area).
Hi everybody I would like to know, if pvmove finds an unreadable block in a=
=20
PV, does it ignore the complete PV or just the bad area? I mean if a 32MB=20
PV has a bad block, the complete 32 megs get ignored, or only the=20
problematic area?
thx in advance,
greg
