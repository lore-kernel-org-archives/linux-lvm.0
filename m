content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <389954B725462C48A5DD935C8E3526CA2E5D62@is-server.bondera.com>
From: "Shahar Klein" <Shahark@savantis.com>
Subject: [linux-lvm] Weird lvm behavior?
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
Date: Mon Mar 31 01:04:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi=20
I'm using lvm on rh7.3 and have two questions.

Generally I'm looking at vg's on SAN from few servers.

1. I'm trying to look at a certain vg(volume group) from two systems.
vgscan automatically "imports" vg's to the destination server(the source
server is the one I created the vg's on). sometimes after reboot vgscan
fails and the workaround is sfdisk -s Can you shed some light on this
phenomena.

2. sometimes(I must did something wrong) when running any vg* command I
get an error message saying that VGDA is not synced=20
And I should run vgscan. I run vgscan but it won't help me.

Thanks ahead.

Shahar Klein.
