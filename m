Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <69596D9C5887874E9A35F6C8DF94B2AB166799@nautilus>
From: "Victor Tan" <VictorTan@stts.com.sg>
Subject: [linux-lvm] (no subject)
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
Date: Mon Oct 27 19:28:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi!

I am running LVM2 on 2.6.0-test8 with 4 x 250GB IDE HDD.

The VG is setup based on 16G PE size, and LV using 4 stripes/4K chunk =
size, mounted with XFS and exported using NFS.

I am trying to test the system using a looping program that performs =
continuous write to the storage from a remote client.

The system so far has not been able to cross the 284GB mark, using =
striped or non-stripe LV. Any clue which sub-system is causing the =
problem?

Regards!
VT
