From: "Kai-Min Sung" <k@kaisung.com>
Message-ID: <002a01c2fffc$057db0c0$02fea8c0@nimiak>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: 
Subject: [linux-lvm] RE: extending LVM for school project
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
Date: Fri Apr 11 02:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux-lvm@sistina.com

Thanks for the slew of suggestions from everyone. Right now, my partner
and I are thinking of a writing a distributed LVM. We're not too sure of
the details yet but we imagine it'd be cool to create a cluster of
storage nodes, each running a distributed LVM that's able to use the
combined network storage and create volumes out of them. For reliability
and high-availability, we'd want to use some form of RAID-ing across
storage nodes so that if any node in the cluster went down, the volume
data would remain intact. I did a google search for distributed volume
managers and found one company, ScaleEight that has created their own
proprietary distributed volume manager. Is anyone familiar with this
company? There's a whitepaper available on their website but I'm having
problems registering for it. Anyone happen to have copy of it?

Thanks,
-Kai



-----Original Message-----
From: Kai-Min Sung [mailto:k@kaisung.com] 
Sent: Tuesday, April 08, 2003 10:55 PM
To: 'Linux-lvm@sistina.com'
Subject: extending LVM for school project

Hey everyone,
	I'm a masters student taking a distributed systems project class
and would like to work on extending LVM. My initial idea was to modify
LVM and allow it to create physical volumes using disks on remote nodes.
But then I read posts about using ENBD to achieve this. Do people on
this list have suggestions or ideas for a fun/interesting project that
could be accomplished within 10 weeks?

Regards,
Kai-Min Sung
