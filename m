From: neuron <neuron@hollowtube.mine.nu>
Subject: Re: [linux-lvm] Performance problem.
Message-Id: <20031118160508.51a05546.neuron@hollowtube.mine.nu>
In-Reply-To: <001a01c3ade4$c4711580$e9000a0a@misato>
References: <3FB8F8A1.1060004@clin.ucl.ac.be>
	<1069087854.2408.0.camel@localhost.localdomain>
	<20031117181007.00e15a29.neuron@hollowtube.mine.nu>
	<3252989968.20031117183528@tnonline.net>
	<20031117191324.2047dbf3.neuron@hollowtube.mine.nu>
	<11955855390.20031117192313@tnonline.net>
	<20031117193054.5dd7eec1.neuron@hollowtube.mine.nu>
	<6557103468.20031117194401@tnonline.net>
	<20031117195218.3093c921.neuron@hollowtube.mine.nu>
	<15458132953.20031117200111@tnonline.net>
	<20031117200500.08c5c876.neuron@hollowtube.mine.nu>
	<003601c3ad5d$c74c8370$6402000a@gasaraki>
	<13712767906.20031118014426@tnonline.net>
	<20031118020523.65476a55.neuron@hollowtube.mine.nu>
	<19014718796.20031118021657@tnonline.net>
	<20031118024250.50134f1c.neuron@hollowtube.mine.nu>
	<000601c3adde$08334ab0$e9000a0a@misato>
	<20031118154221.51e31ee3.neuron@hollowtube.mine.nu>
	<001a01c3ade4$c4711580$e9000a0a@misato>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Tue Nov 18 09:07:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

no idea if you can convert the data, but as you can resize, you can probably move stuff to lvm2 that way.

> > great, dunno about testing.
> > Copying large amounts of data atleast.
> > Also fragmentation is an issue to keep in mind, so duplicate the disk,
> don't cp the data over.
> 
> The idea was to use dd to duplicate the system disk, then create a LV (LVM1
> metadata) outof two new disks which are then filled with data. After that,
> I'll begin migrating to devicemapper but with lvm1 metadata.
> 
> All tests will in the beginning be read tests (since that's more important
> to me). These tests will be "time cat > /dev/null" aswell as accessing the
> data remotely via NFS/SMB/FTP. After that test, I'll migrate to LVM2
> metadata, since thats what I want to use for real later, and then redo the
> tests using the same data.
> 
> I assume that it will be possible to migrate the metadata to LVM2?
> 
> It's going to be a long evening/night :)
> 
> /Henric
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
