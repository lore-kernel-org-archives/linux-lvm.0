From: NagyZ <nagyz@piarista-kkt.sulinet.hu>
Subject: Re: [linux-lvm] hard disk crash
In-Reply-To: <20021031184941.A2339@sistina.com>
Message-ID: <Pine.LNX.4.44.0210311905180.25933-100000@server.piarista-kkt.sulinet.hu>
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
Date: Thu Oct 31 12:09:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, 31 Oct 2002, Heinz J . Mauelshagen wrote:

> 
> You mentioned that you were dd'ing stuff of the partially failed drive.
> 
> If you get a replacement drive of the same size, dd everything onto it,
> "pvcreate -ff ..." it and vgcfgrestore LVM's metadata onto it.
> "vgscan;vgchange -ay" afterwards should bring your VG back to life but you
> will loose some of your data.
> 
> As already said by Jon: you want to go RAID1/5.

yes, i know i'll loose data.
thnx, i'll try that..

i said to the boss to gimme money to buy some disks, then i'll do hw 
mirroring..

NagyZ
