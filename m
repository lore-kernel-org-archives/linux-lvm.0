From: "William Blunn" <bill+f.9sfuw6uo@tao-group.com>
Subject: Re: [linux-lvm] Urgent, Moving disk from hdc to hdf in existing lvm
Message-ID: <BDEMIPDEGABMNEFIHCPDIEGODOAA.bill+f.9sfuw6uo@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <E17kNKO-0003CV-00@hermes.sistina.com>
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
Date: Thu Aug 29 06:51:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Is it possible to "reconfigure" the vg so that the disk that once=20
> was hdc will be hdf? Prefably without loosing data.

The position of a PV within the LVM is controlled by the metadata stored wi=
thin the PV, not the device identifier.

There is no reconfiguration per se necessary.

If your startup scripts don't do vgscan, then you will need to do one of th=
ese manually.

I think it is something like:

vgchange -an
vgscan
vgchange -ay

Of course if you have put your root filesystem in LVM then you are stuffed =
(and I have no sympathy for anyone in this situation).

Bill

The contents of this e-mail and any attachments are confidential and may
be legally privileged. If you have received this e-mail and you are not
a named addressee, please inform us as soon as possible on
+44 118 901 2999 and then delete the e-mail from your system. If you are
not a named addressee you must not copy, use, disclose, distribute,
print or rely on this e-mail. Any views expressed in this e-mail or any
attachments may not necessarily reflect those of Tao's management.
Although we routinely screen for viruses, addressees should scan this
e-mail and any attachments for viruses. Tao makes no representation or
warranty as to the absence of viruses in this e-mail or any attachments.
Please note that for the protection of our business, we may monitor and
read e-mails sent to and from our server(s).

Visit our website at http://tao-group.com/
