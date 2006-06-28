Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5SJ1j1k021086
	for <linux-lvm@redhat.com>; Wed, 28 Jun 2006 15:01:45 -0400
Received: from web31413.mail.mud.yahoo.com (web31413.mail.mud.yahoo.com
	[68.142.198.125])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k5SJ1hh5012324
	for <linux-lvm@redhat.com>; Wed, 28 Jun 2006 15:01:43 -0400
Message-ID: <20060628190136.79139.qmail@web31413.mail.mud.yahoo.com>
Date: Wed, 28 Jun 2006 12:01:36 -0700 (PDT)
From: Teak Billard <teamwassily@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1992713943-1151521296=:78666"
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Uuid for unknown device blows up VolGroup00
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--0-1992713943-1151521296=:78666
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Dear all,

I recently tried to add an old 30 GB hard drive lying in my machine to my FC5 system.  I was trying to add the 30 GB to VolGroup00.  I failed somehow and now the entire VolGroup00 is inaccessible.  When booting I get a Kernel panic - not syncing: Attempted to kill init!  I think if I removed the offending Uuid from VolGroup00 things would go back to normal.

Here's the output of some lvm commands from the FC Rescue Disk:

 lvm> pvscan
 Couldn't find device with uuid '8YsyEa-r5Rx-2LLI-Zz7n-xr8s-VksP-Mhs0Wi'
 PV  /dev/hdb3             VG VolGroup00  lvm2  [47.81 GB / 32.00 MB free]
 PV unknown device      VG VolGroup00  lvm2  [27.94 GB / 27.94 GB free]
 Total: 2 / in use: 2 / in no VG: 0
 
 lvm> vgscan
 Couldn't find device with uuid: '8YsyEa-r5Rx-2LLI-Zz7n-xr8s-VksP-Mhs0Wi'.
 Couldn't find all phsyical volumes for volume group VolGroup00
 Couldn't find device with uuid: '8YsyEa-r5Rx-2LLI-Zz7n-xr8s-VksP-Mhs0Wi'.
 Couldn't find all phsyical volumes for volume group VolGroup00
 Volume Group "VolGroup00" not found

When I do an lvm pvdisplay, it reveals that VolGroup00 has two uuid's in it. One is /dev/hdb3 with uuid M3CWKv-a2yK-b5Qu-rLzq-Aj27-lXxE-WzvkWE and the other is unknown device with uuid 8YsyEa-r5RX-2LLI-Zz7n-Xr8s-VksP-Mhs0Wi.


I would greatly appreciate any help.  I'm currently unable to get at my data since it was all in VolGroup00.  Please help me if you can. :)

Teak

 		
---------------------------------
Do you Yahoo!?
 Get on board. You're invited to try the new Yahoo! Mail Beta.
--0-1992713943-1151521296=:78666
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Dear all,<br><br>I recently tried to add an old 30 GB hard drive lying in my machine to my FC5 system.&nbsp; I was trying to add the 30 GB to VolGroup00.&nbsp; I failed somehow and now the entire VolGroup00 is inaccessible.&nbsp; When booting I get a Kernel panic - not syncing: Attempted to kill init!&nbsp; I think if I removed the offending Uuid from VolGroup00 things would go back to normal.<br><br>Here's the output of some lvm commands from the FC Rescue Disk:<br><br> lvm&gt; pvscan<br> Couldn't find device with uuid '8YsyEa-r5Rx-2LLI-Zz7n-xr8s-VksP-Mhs0Wi'<br> PV  /dev/hdb3             VG VolGroup00  lvm2  [47.81 GB / 32.00 MB free]<br> PV unknown device      VG VolGroup00  lvm2  [27.94 GB / 27.94 GB free]<br> Total: 2 / in use: 2 / in no VG: 0<br> <br> lvm&gt; vgscan<br> Couldn't find device with uuid: '8YsyEa-r5Rx-2LLI-Zz7n-xr8s-VksP-Mhs0Wi'.<br> Couldn't find all phsyical volumes for volume group VolGroup00<br> Couldn't find device with uuid:
 '8YsyEa-r5Rx-2LLI-Zz7n-xr8s-VksP-Mhs0Wi'.<br> Couldn't find all phsyical volumes for volume group VolGroup00<br> Volume Group "VolGroup00" not found<br><br>When I do an lvm pvdisplay, it reveals that VolGroup00 has two uuid's in it. One is /dev/hdb3 with uuid M3CWKv-a2yK-b5Qu-rLzq-Aj27-lXxE-WzvkWE and the other is unknown device with uuid 8YsyEa-r5RX-2LLI-Zz7n-Xr8s-VksP-Mhs0Wi.<br><br><br>I would greatly appreciate any help.&nbsp; I'm currently unable to get at my data since it was all in VolGroup00.&nbsp; Please help me if you can. :)<br><br>Teak<br><p>&#32;
		<hr size=1>Do you Yahoo!?<br> 
Get on board. <a href="http://us.rd.yahoo.com/evt=40791/*http://advision.webevents.yahoo.com/handraisers">You're invited</a> to try the new Yahoo! Mail Beta.
--0-1992713943-1151521296=:78666--
