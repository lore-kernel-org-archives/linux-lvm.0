Message-ID: <3D7F0F54.86F71021@az1.de>
From: "Andreas G. Schindler" <schindler@az1.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM in Dual Path SAN Environment
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
Date: Wed Sep 11 04:41:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux-LVM@sistina.com

A Question to the LVM Guy(s):

We would like to use Linux LVM to overcome the fact, Linux doesn't 
currently support Dual-Path access to SAN (Fibre-Channel) units.

Rumors are, LVM is able to detect multiple paths to a PV (in my case
a SAN SCSI LUN) and will rearrange it to one single PV.

As far as i see, this should solve the problem during regular operation
(i.e. both paths to the SAN active). But what about the really interesting
case of failure on one link? If this is the currently 'active' link (that
one, still in t LVM's PV list), we need a failover and rearrangement
of the PV list on the fly.

Does this work ??

Many thanks in advance

Regards, Andreas

-- 

Dr. Andreas G. Schindler        c/o Alpha Zero One Computersysteme GmbH
schindler@az1.de                Frankfurter Str. 141, D-63303 Dreieich
Tel +49 6103 57187 21           Germany
