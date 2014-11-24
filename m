Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAOCI8iI021457
	for <linux-lvm@redhat.com>; Mon, 24 Nov 2014 07:18:08 -0500
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAOCI46X016466
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 24 Nov 2014 07:18:05 -0500
Received: by mail-qc0-f174.google.com with SMTP id c9so6609894qcz.19
	for <linux-lvm@redhat.com>; Mon, 24 Nov 2014 04:18:04 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 24 Nov 2014 13:18:04 +0100
Message-ID: <CANvCAA_9OiZug5Xo6S_x2m-Orc1JeuhNAX02cSE4SgijP2Ki7w@mail.gmail.com>
From: Tomas Dalebjork <tomas.dalebjork@repostor.com>
Content-Type: multipart/alternative; boundary=001a11c30192511e14050899c925
Subject: [linux-lvm] How to use 'lvconvert --merge' to copy back data but
	keep snapshot
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
To: linux-lvm@redhat.com

--001a11c30192511e14050899c925
Content-Type: text/plain; charset=UTF-8

Hi,

I have a need to copy only changed block back to its origin from the
snapshot, but keep the snapshot device; similar to "lvconvert --merge".

Are there a way to do this?

Or can I use the below C code to perform this?

https://fbo.no-ip.org/svn/fbo/lvmsync+/lvmdiff.c
https://fbo.no-ip.org/svn/fbo/lvmsync+/lvmdiff.c

But instead of copying data from the /dev/mapper/vg-lv-real device to an
incremental file; by reading its <exception> data from the
/dev/mapper/vg-lv-cow; do this in like in reverse order.

Eg reading exception data from /dev/mapper/vg-lv-cow, read snapshot data
from /dev/mappper/vg-lv-cow and write its content to /dev/mapper/vg-lv or
/dev/mapper/vg-lv-real

..

	while ( progress ) {
		// process a single metadata chunk
		for(i=0;i<(chunksize/16);i++) {
			// Read a single chunk-pointer pair
			read(difffd,&ofs_origin,sizeof(ofs_origin));
			read(difffd,&ofs_snap,sizeof(ofs_snap));
			// this is the end of the chain
			if ( ofs_snap == 0 ) {
				progress=0;
				break;
			}
			ofs_realposition=ofs_origin * chunksize;

			// Read changed chunk from ref-device
			if ( lseek(reffd,ofs_realposition,SEEK_SET) != ofs_realposition ) {
				fprintf(stderr,"E: Seek on reference device '%s'@0x%016llX
failed, aborting.\n",refdev,(long long)ofs_realposition);
				close(reffd);close(difffd);return 0;
			}
			if ( result=blockread(difffd,buffer,chunksize) != chunksize ) {
				fprintf(stderr,"E: Unable to read all the data of block '%016llX'
(got %i of %i), aborting.\n",(long
long)ofs_realposition,result,chunksize);
				close(difffd);close(reffd);return 0;
			}

			if ( result=blockwrite(refffd,buffer,chunksize) != chunksize ) {
				fprintf(stderr,"E: Unable to write all the data of block
'%016llX', aborting (wrote %i of %i).\n",(long
long)ofs_realposition,result,chunksize);
				close(difffd);close(reffd);return 0;
			}
		}
		stat_metadatachunks++;
	}
	if ( VERBOSE ) {
		fprintf(stderr,"I: Number of blocks: %li (%li
Bytes)\n",stat_chunks,stat_chunks*chunksize);
	}
	close(difffd);
	close(reffd);
	return 1;
}

int blockwrite(int fd,char *buffer,size_t size) {
	int done=0;
	int result;
	while ( done != size ) {
		result=write(fd,&buffer[done],size-done);
		if ( result <= 0 ) {
			return -1;
		} else {
			done += result;
		}
	}
	return size;
}

int blockread(int fd,char *buffer,size_t size) {
	int done=0;
	int result;
	while ( done != size ) {
		result=read(fd,&buffer[done],size-done);
		if ( result > 0 ) {
			done += result;
		} else {
			if ( done == 0 ) {
				return -1;
			} else {
				return done;
			}
		}
	}
	return size;
}

--001a11c30192511e14050899c925
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hi,<br><br></div>I have a need to copy=
 only changed block back to its origin from the snapshot, but keep the snap=
shot device; similar to &quot;lvconvert --merge&quot;.<br><br></div>Are the=
re a way to do this?<br><br></div>Or can I use the below C code to perform =
this?<br><br><a href=3D"https://fbo.no-ip.org/svn/fbo/lvmsync+/lvmdiff.c">h=
ttps://fbo.no-ip.org/svn/fbo/lvmsync+/lvmdiff.c</a><a href=3D"https://fbo.n=
o-ip.org/svn/fbo/lvmsync+/lvmdiff.c">https://fbo.no-ip.org/svn/fbo/lvmsync+=
/lvmdiff.c</a><br><br></div>But instead of copying data from the /dev/mappe=
r/vg-lv-real device to an incremental file; by reading its &lt;exception&gt=
; data from the /dev/mapper/vg-lv-cow; do this in like in reverse order.<br=
><br>Eg reading exception data from /dev/mapper/vg-lv-cow, read snapshot da=
ta from /dev/mappper/vg-lv-cow and write its content to /dev/mapper/vg-lv o=
r /dev/mapper/vg-lv-real<br><br>..<br><pre>	while ( progress ) {
		// process a single metadata chunk
		for(i=3D0;i&lt;(chunksize/16);i++) {
			// Read a single chunk-pointer pair
			read(difffd,&amp;ofs_origin,sizeof(ofs_origin));
			read(difffd,&amp;ofs_snap,sizeof(ofs_snap));
			// this is the end of the chain
			if ( ofs_snap =3D=3D 0 ) {
				progress=3D0;
				break;
			}
			ofs_realposition=3Dofs_origin * chunksize;</pre><pre>			// Read changed =
chunk from ref-device
			if ( lseek(reffd,ofs_realposition,SEEK_SET) !=3D ofs_realposition ) {
				fprintf(stderr,&quot;E: Seek on reference device &#39;%s&#39; at 0x%016=
llX failed, aborting.\n&quot;,refdev,(long long)ofs_realposition);
				close(reffd);close(difffd);return 0;
			}
<br>			if ( result=3Dblockread(<span style=3D"background-color:rgb(255,255,=
0)">difffd</span>,buffer,chunksize) !=3D chunksize ) {
				fprintf(stderr,&quot;E: Unable to read all the data of block &#39;%016l=
lX&#39; (got %i of %i), aborting.\n&quot;,(long long)ofs_realposition,resul=
t,chunksize);
				close(difffd);close(reffd);return 0;
			}<br><br>			if ( result=3Dblockwrite(refffd,buffer,chunksize) !=3D chunk=
size ) {
				fprintf(stderr,&quot;E: Unable to write all the data of block &#39;%016=
llX&#39;, aborting (wrote %i of %i).\n&quot;,(long long)ofs_realposition,re=
sult,chunksize);
				close(difffd);close(reffd);return 0;
			}
		}
		stat_metadatachunks++;
	}
	if ( VERBOSE ) {
		fprintf(stderr,&quot;I: Number of blocks: %li (%li Bytes)\n&quot;,stat_ch=
unks,stat_chunks*chunksize);
	}
	close(difffd);
	close(reffd);
	return 1;
}<br><br>int blockwrite(int fd,char *buffer,size_t size) {
	int done=3D0;
	int result;
	while ( done !=3D size ) {
		result=3Dwrite(fd,&amp;buffer[done],size-done);
		if ( result &lt;=3D 0 ) {
			return -1;
		} else {
			done +=3D result;
		}
	}
	return size;
}

int blockread(int fd,char *buffer,size_t size) {
	int done=3D0;
	int result;
	while ( done !=3D size ) {
		result=3Dread(fd,&amp;buffer[done],size-done);
		if ( result &gt; 0 ) {
			done +=3D result;
		} else {
			if ( done =3D=3D 0 ) {
				return -1;
			} else {
				return done;
			}
		}
	}
	return size;
}
<br></pre></div>

--001a11c30192511e14050899c925--
