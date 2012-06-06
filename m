Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q56B09LJ029114
	for <linux-lvm@redhat.com>; Wed, 6 Jun 2012 07:00:12 -0400
Received: from mermoz.linkfluence.net (mermoz.linkfluence.net [91.121.30.121])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q56B07dE024340
	for <linux-lvm@redhat.com>; Wed, 6 Jun 2012 07:00:08 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mermoz.linkfluence.net (Postfix) with ESMTP id 474BDA0
	for <linux-lvm@redhat.com>; Wed,  6 Jun 2012 13:00:06 +0200 (CEST)
Received: from mermoz.linkfluence.net ([127.0.0.1])
	by localhost (mermoz.linkfluence.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id V5qToWSZMjzm for <linux-lvm@redhat.com>;
	Wed,  6 Jun 2012 13:00:05 +0200 (CEST)
Received: from [10.0.0.207] (90.42.71.86.rev.sfr.net [86.71.42.90])
	by mermoz.linkfluence.net (Postfix) with ESMTPSA id 7098169
	for <linux-lvm@redhat.com>; Wed,  6 Jun 2012 13:00:05 +0200 (CEST)
From: Germain Maurice <gmaurice@linkfluence.net>
Date: Wed, 6 Jun 2012 13:00:04 +0200
Message-Id: <D67328BA-3B40-40A1-9EF9-EE2B3C976FDB@linkfluence.net>
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] The way i use to ensure the VG map (Need help)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

Still with my huge problems (regular fs corruption inside KVM guests). I use a shared LVM on a SAN storage, without CLVM :(.

I would like to be sure I don't have LVs overlaping each other.
I ran vgck SATA6To, that doesn't produce output, so I expect everything is good on disk.

So, i tried to do the same on device mapper with the following script :
#!/usr/bin/perl
while(<>) {
#   SATA6To-vm--316--disk--3: 0 8388608 linear 152:16 31457664
   my ( $vol, $vol_start, $vol_size, $alloc, $raid, $pos ) = split( /\s/, $_ );

   if( $vol =~ /^sata6to-vm--(\d{3})--disk--(\d)/i ) {
       my $vm = $1;
       my $disk = $2;

       if( defined $vms->{ $vm }->{ $disk } ) {
           die "HUGE PROBLEM: VM $vm DISK $disk ALREADY EXISTS!!!\n";
       }

       my $start = $pos;
       my $stop  = $pos+$vol_size-1;

       $vms->{ $vm }->{ $disk } = {
           start => $start,
           stop  => $stop, 
       };

       if( defined $map->{ $start } ) {
           warn "VM $vm/$disk WANTS TO START ON " . Dump $map->{ $start };
       }
       $map->{ $start } = { "$vm/$disk" => 'start' };

       if( defined $map->{ $stop } ) {
           warn "VM $vm/$disk WANTS TO STOP ON " . Dump $map->{ $stop };
       }
       $map->{ $stop }  = { "$vm/$disk" => 'stop' };
   }
}

for my $pos ( sort{ $a <=> $b } keys %$map ) {

   printf( "%010d\t%s\t%s\n", $pos, ( %{ $map->{ $pos } } ) );

}

It produces this kind of output :
0000000384	316/1	start
0020971903	316/1	stop
0020971904	316/2	start
0031457663	316/2	stop

We check that no LV would start before a previous LV stop. By the way I did on the whole cluster to ensure I get the same result on the nodes.

Is it a good way to check the consistancy between LVM metadata and DeviceMapper ?

Your help will be precious, I'm going mad.
