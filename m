Return-Path: <Stephan.Hendl@lds.brandenburg.de>
Message-Id: <sac1a0ae.076@lvnbb.brandenburg.de>
Date: Wed, 28 Mar 2001 08:27:53 +0200
From: "Stephan Hendl" <Stephan.Hendl@lds.brandenburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: [linux-lvm] alternate pathing with lvm?
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "<" <linux-lvm@sistina.com>

Hi all,

following the discussions in last June and Hovember, resp. I want to ask =
oncemore wether there is an alternate pathing with the linux-lvm possible =
or not. We are using several HP MC/SG-Cluster and want to implement an =
Linux-Cluster with the RadHat Cluster Software too. In the backend there =
is a HP XP512 and a SAN; the Linuxserver shell be connected to the =
Storagebox via two FC-HBAs (like the HP servers are). We do not need an =
online load balancing, all we want is to have a feature for continous work =
during firmwareupdates, configuration works on FC-switches and so on.

regards
Stephan


--
LDS Brandenburg
Dr. Stephan Hendl
fon: +49-(0)331-39 471
fax: +49-(0)331-27548 1187
EMail: stephan.hendl@lds.brandenburg.de
