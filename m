From: Magosanyi Arpad <mag@bunuel.tii.matav.hu>
Message-ID: <20011102195538.A467@bunuel.tii.matav.hu>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] next step of recovering from tha vgchange problem
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
Date: Fri Nov  2 12:54:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi!

I am very unhappy with the fact that I had zero feedback from
the developers of lvm, in spite that I have lost all my data.
Yes, this is an open source software, and I was using a feature
which is (I believe) marked as experimental. On the other side
the product is one of the flagship ones of the company for the
developers work, and it was (with the snapshotting feature) in
the stable kernel.

I could backup my data, and my volume group seems to be nearly
consistent now. I still have questions and concerns. For the record,
here is how I have recovered, and my questions are at the end
of the mail.

Keywords: OOPS, vgchange, snapshot, rdev =3D 65535, "Bad address" activatin=
g volume group

It started with not being able to do vgchange -ay, see my previous posts
for details. It turned out that I had a snapshot of one of my lv's, and
vgchange could not activate this one. Because of that, I could not do
anything with my volume group.
After some 4 days and zero feedback from the developers,
I succeded to activate my volume group. The trick was to get rid of=20
the code path which had the comment:
        /* Second path to correct snapshot logical volumes which are not
          in place during first path above */
You can find the report of that stage and a patch in the archives.
In that point I still has not got a consistent volume group in spite
of the fact that vgck found it to be OK. I was asking for pointers to
clean up the thing, but again, zero feedback.
After that I was trying to cut the wrong snapshot volume of the vg.
First of course I did a backup, because at this point I could at least.
It took cuts in the following points:
	-zero out the lv entry from the pv
	-set the mode of the snapshotted lv to 3 (don't ask me what does
	that 3 means)
	-decrement the number of lv's in the pv and the vg structure
I did it with dd and by reading lvm.h, along the same lines as the
uuid restorer trick does it.
first dd-ed out the data needeed from the disk to a file, made a backup of =
it,
edited it with vi, and dd-ed back to it original place. The areas to dd out
could be obtained from the output of pvdata -PP.
Sorry about not giving more details, but I feel that those who are smart
enough not to fuzz their data up by following a more detailed howto can
do it by this description, and I simply have no nerve to be more exact after
10 ours of binary editing.

After the surgery was done, I created a logical volume with the same size
my original snapshotted lv had, and backed it up by dd.
Now I could lvremove my snapshotted lv.
I created and removed logical volumes in the hope
that the extents alocated to the snapshot and the snapshotted lv are freed.

My questions and concerns:
It seems that I have some "lost clusters" of extents. They are listed as
belonging to the two logical volumes I got rid off.
At the first sight, the sum of lv sizes is less than the
size of all allocated extents. (only calculated roughly, so not sure)
It is normal, or some inconsistency remaining?
If it isn't ok, how to make my vg consistent?
Is there any other source of inconsistency I am not aware of?

--=20
GNU GPL: csak tiszta forr=E1sb=F3l
