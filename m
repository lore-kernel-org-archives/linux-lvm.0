From: "William Blunn" <bill--f.juq41dsj@tao-group.com>
Subject: Re: [linux-lvm] hdd problem plz help me
Message-ID: <BDEMIPDEGABMNEFIHCPDKEMNFAAA.bill--f.juq41dsj@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20030619020243.30329.qmail@web14903.mail.yahoo.com>
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
Date: Thu Jun 19 09:44:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> i have two 80GB hdd"s . Now i want a make two hdd"s to a single partiotion

> how can i made it any option in redhat linux 7.3

You have one or more HDDs, each with their own separate space.

You want to map these HDD spaces to one or more logical spaces.

Probably the most practical ways to do this will involve (software) RAID an=
d/or LVM.

There are a variety of different approaches depending on what you are tryin=
g to achieve.

You might want to try reading these first:

The Software-RAID HOWTO

  http://tldp.org/HOWTO/Software-RAID-HOWTO.html

Logical Volume Manager HOWTO

  http://tldp.org/HOWTO/LVM-HOWTO/index.html

If you have a question, remember post your message in plain text if possibl=
e.

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
