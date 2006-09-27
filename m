Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8RE60oJ006172
	for <linux-lvm@redhat.com>; Wed, 27 Sep 2006 10:06:00 -0400
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8RE5nr1027879
	for <linux-lvm@redhat.com>; Wed, 27 Sep 2006 10:05:49 -0400
Received: from wolverine (unknown [192.168.1.127])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id 25DFF12EDE
	for <linux-lvm@redhat.com>; Wed, 27 Sep 2006 15:05:43 +0100 (BST)
From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: [linux-lvm] Examining a snapshot
Date: Wed, 27 Sep 2006 15:07:29 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0363_01C6E246.A6915BD0"
In-Reply-To: <20060927025716.GB10619@highgate.net.nz>
Message-Id: <20060927140543.25DFF12EDE@bluewhale.planbit.co.uk>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------=_NextPart_000_0363_01C6E246.A6915BD0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Nick,

Mark McLoughlin has done a lot of work on a neat "lvmerge" utility, but lvmerge isn't merged with the main LVM utilities yet....
When it does arrive, this will definitely be the "way to go".

In the meantime, however...

Prashanth Radhakrishnan did a load of work on this some time ago and very kindly sent me a copy of his code when I asked him.  It
had one issue which I resolved to do with the COW block device not being opened in O_DIRECT mode.

The resulting "show-cow.c" will dump a list of all the 8K blocks that have been stored in the snapshot.  You can easily modify this
to provide the data in whatever format you want.
 
I have also combined this with a block copy function to allow a LV snapshot to be merged back into its parent.  It is NOT as clean
or efficient as Mark McLoughlin's version, but it is simple and easy to understand.  The comments in each of the programs will
explain how it is working.

All supplied without warranty, blah blah, but feel free to drop me an e-mail (on- or off-list) if you have any questions or problems
with them.

To compile them:

	gcc -O2 -Wall show-cow.c -o show-cow
	gcc -O2 -Wall lvmerge-snap2lv.c -o lvmerge-snap2lv

Best regards,

Roger

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Nick Wright
> Sent: 27 September 2006 03:57
> To: linux-lvm@redhat.com
> Subject: [linux-lvm] Examining a snapshot
> 
> Hi all,
> 
> I have a backup strategy in place where I use snapshots to determine
> the difference between yesterday and today. I then copy those blocks
> that have changed to a target machine and apply the difference to a
> remote copy of the entire block device.
> 
> Currently this involves doing a complete comparison between a logical
> volume and its snapshot to find the blocks that have changed. I know
> that internally, LVM already has the information about which blocks
> have been altered -- these are what are stored in the snapshot after
> all.
> 
> Is it possible for me to get that information somehow? Some pointers
> getting me started on this would be of great help to me -- especially
> if theres a simple way to do so already in place before I go delving
> into source code etc...
> 
> 
> 
> Thanks
> 
> 
> Nick
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

------=_NextPart_000_0363_01C6E246.A6915BD0
Content-Type: text/plain;
	name="show-cow.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="show-cow.c"

#define _GNU_SOURCE
#define _FILE_OFFSET_BITS 64		///< We must be in 64-bit file I/O mode
#define _XOPEN_SOURCE 500

#include <sys/stat.h>
#include <sys/types.h>
#include <stdint.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <inttypes.h>
#include <fcntl.h>
#include <errno.h>
#include <malloc.h>

/* FROM dm.h */
#define SECTOR_SHIFT	9
#define SECSIZE		512

/*
 * Magic for persistent snapshots
 */
#define SNAP_MAGIC 0x70416e53

/*
 * The on-disk version of the metadata
 */
#define SNAPSHOT_DISK_VERSION 1

/*
 * LVM snapshot on-disk Layout
 *
 * The disk is divided into chunks each of (chunk_size * sector_size) bytes.
 * The boxes below represent chunks. chunk_size itself is stored in the header.
 *
 *      +-------+ 0
 *      |       | ====> contain header info
 *      |       |
 *      |       |
 *      |-------| 1
 *      |       | ====> contains metadata. i.e. exceptions_per_area (say X)
 *      |       |       (lv_chunk, cow_chunk) pairs. the next X chunks have
 *      |       |       the actual data.
 *      |-------| 2
 *      |       |
 *      |       |
 *      |       |
 *      |-------| 3
 *      .       .
 *      .       .
 *      .       .
 *      |-------| X + 2
 *      |       | =====> meta data chunk again ! similar to 1.
 *      |       |
 *      |       |
 *      |-------| X + 3
 *      .       .
 *      .       .
 *      .       .
 * 
 * Speficially, with an 8192 byte chunk size and 16 bytes per exception entry,
 * we have 512 exception entries per metadata chunk.  The disk layout is 
 * therefore:
 *		0x00000000	Header Information
 *		0x00002000  1st Metadata area: 512 exception entries
 *		0x00004000  1st exception data block
 *		0x00006000  2nd exception data block
 *			...
 *		0x00402000	512th exception data block
 *		0x00404000  2nd Metadata area: 512 exception entries
 *		0x00406000  1st exception data block
 *		0x00408000  2nd exception data block
 *			...
 *		0x00804000	512th exception data block
 *		0x00806000  3rd Metadata area: 512 exception entries
 *			etc
 *
 * 
 * The snapshot COW table is filled from the beginning to the end.  Each 
 * metadata area is completely filled so the end of the file can be determined
 * by looking for a metadata area where the COW chunk offset is 0.  This is 
 * illegal because offset 0 in the COW file is the header and not a data block,
 * and therefore marks the end of the table.
 *
 * There is no attempt to optimise the table for faster searches using hash
 * tables or similar.  These may be done if the table is loaded into memory and
 * then restructured.  If the table is not loaded into memory and the on-disk 
 * layout must be used, a linear search is the only solution to determine if a 
 * COW block exists.  This is not a problem if the COW data is small, but if
 * the LV is large and the COW proportion significant then a lot of metadata 
 * must be read from disk (or cached in memory).
 * 		e.g. 100GB LV with 10% COW
 *			COW data = 10GB
 *			COW data blocks = 1,310,720 blocks
 *			COW metadata areas = 2,560
 *			COW metadata total size = 20MB
 *
 * Hence, in this example, checking to see if a single 8KB block of data exists
 * in the COW will require up to 2,560 separate disk reads totalling 20 MB of 
 * data.
 */


struct disk_header {
	uint32_t magic;

	/*
	 * Is this snapshot valid.  There is no way of recovering
	 * an invalid snapshot.
	 */
	uint32_t valid;

	/*
	 * Simple, incrementing version. no backward
	 * compatibility.
	 */
	uint32_t version;

	/* In sectors */
	uint32_t chunk_size;

	// The rest of the header chunk is unused
};

struct disk_exception {
	uint64_t lv_chunk;
	uint64_t cow_chunk;
};


#define		CHUNK2SECTOR(_sec)		((_sec) * chunk_size)
#define		SECTOR2CHUNK(_chunk)	((_chunk) / chunk_size)
#define		CHUNK2BYTES(_sec)		((CHUNK2SECTOR(_sec))* (1 << SECTOR_SHIFT))

#define DISK_BUF_SIZE		(1024*1024)

#if __BYTE_ORDER == __LITTLE_ENDIAN
#define le32_to_cpu(x) (x)
#define le64_to_cpu(x) (x)
#else
#define le32_to_cpu(x) __bswap_32(x)
#define le64_to_cpu(x) __bswap_64(x)
#endif

/*
 * Globals used in the file
 */
int32_t	chunk_size;	/* chunk size in sectors */

// ----------------------------------------------------------------------------
// Wrapper functions since it is permitted for a file read/write operation to 
// return a partial result.
// ----------------------------------------------------------------------------

ssize_t safe_pread(int fildes, void *buf, size_t nbyte, off_t offset)
{
	ssize_t res;
	ssize_t total;

//	printf("safe_pread(%i,%p,%lli,0x%016llx)\n", fildes, buf, (off_t)nbyte, offset);
	for(total = 0; total < nbyte; total += res)
	{
		res = pread(fildes, buf + total, nbyte - total, offset + total);
		if (res < 0)
		{
			fprintf(stderr,"File read error in %s line %i, error %i (%s)\n", 
				__FILE__, __LINE__, errno, strerror(errno));
			exit(1);
		}
	}
	return total;
}

ssize_t safe_pwrite(int fildes, void *buf, size_t nbyte, off_t offset)
{
	ssize_t res;
	ssize_t total;
//	printf("safe_pwrite(%i,%p,%lli,0x%016llx)\n", fildes, buf, (off_t)nbyte, offset);
	for(total = 0; total < nbyte; total += res)
	{
		res = pwrite(fildes, buf + total, nbyte - total, offset + total);
		if (res < 0)
		{
			fprintf(stderr,"File read error in %s line %i, error %i (%s)\n",
				__FILE__, __LINE__, errno, strerror(errno));
			exit(1);
		}
	}
	return total;
}

// ----------------------------------------------------------------------------
// Wrapper functions to allow O_DIRECT file access to be robust like general
// file access.  This has a performance impact if it has to rewrite the call
// but makes life much easier@the higher layers.
// ----------------------------------------------------------------------------

int isAligned(off_t offset)
{
	int pagesize=getpagesize();
	return !(offset % pagesize);
}

off_t getPageBase(off_t offset)
{
	int pagesize=getpagesize();
	return (offset/pagesize)*pagesize;
}

off_t getPageOffset(off_t offset)
{
	int pagesize=getpagesize();
	return offset % pagesize;
}

ssize_t getPageLength(off_t offset, ssize_t len)
{
	int pagesize=getpagesize();
	return ((offset+len + pagesize - 1)/pagesize)*pagesize;
}

ssize_t pread_direct(int fd, void *buf, size_t nbyte, off_t pos)
{
	if (isAligned((unsigned)buf) && isAligned(nbyte) && isAligned(pos))
	{
//		printf("SAFE PREAD DIRECT\n");
		// All parameters are safe, so call directly.
		return safe_pread(fd, buf, nbyte, pos); 
	}
	else
	{
		// We cannot take any chances so we must reallocate the required buffer
		ssize_t r;
		off_t readBase = getPageBase(pos);
		off_t readLen = getPageLength(pos, nbyte);

		void *alignedbuff = valloc(readLen);
		if (!alignedbuff)
		{
			printf("Cannot allocate buffer\n");
			exit(1);
		}

//		printf("UNSAFE PREAD DIRECT(%i,%p,%lli,0x%016llx)\n", fd, buf, (off_t)nbyte, pos);
		
		r = safe_pread(fd, alignedbuff, readLen, readBase); 
		if (r < 0) {
			fprintf(stderr,"File read error in %s line %i, error %i (%s)\n",
				__FILE__, __LINE__, errno, strerror(errno));
			exit(1);
		}

		memcpy(buf, alignedbuff + getPageOffset(pos), nbyte);
		free(alignedbuff);
		return (nbyte < r)?nbyte:r;
	}
}

static int
read_header(int ifd, struct disk_header *dh)
{
	pread_direct(ifd, dh, sizeof(*dh), 0); 

	// Perform endian corrections in-situ
	dh->valid = le32_to_cpu(dh->valid);
	dh->version = le32_to_cpu(dh->version);
	dh->chunk_size = le32_to_cpu(dh->chunk_size);
	return 0;
}

/*
 * convert (if reqd),
 *	from :	/dev/vg/lv
 *
 *	to   :	/dev/mapper/vg-lv-cow
 */
static int
convert_to_mapper(char *lvm_dev, char **mapper_dev)
{
	char	*lv;

	if (lvm_dev[0] != '/') {
		printf("convert_to_mapper: %s not an absolute path\n",
								lvm_dev);	
		return -1;
	}

	/* 5 -> "/dev/" */
	if (!(lv = strrchr(lvm_dev + 5, '/'))) {
		printf("convert_to_mapper: invalid path %s\n", lvm_dev);	
		return -1;
	}

	/*
	 * check if this is already a mapper device
	 */
	if (!strncmp(lvm_dev + 5, "mapper", 6)) {
		printf("convert_to_mapper: should not already be a mapper path %s\n", lvm_dev);	
		return -1;	
	}	

	/* 12 -> "mapper", "-", "-cow", '\0' */
	*mapper_dev = malloc(strlen(lvm_dev) + 12);
	strcpy(*mapper_dev, "/dev/mapper/");

	/* copy vg */
	strncat(*mapper_dev, lvm_dev + 5, (size_t) (lv - (lvm_dev + 5)));
	strcat(*mapper_dev, "-");

	/* copy lv */
	strcat(*mapper_dev, lv + 1);
	strcat(*mapper_dev, "-cow");

	return 0;
}


static int process_mappings(int snapCowFd, char *buf, uint32_t exceptions_per_area, int *full)
{
	unsigned int			i;
	uint64_t				lv_chunk, cow_chunk;
	struct disk_exception	*de;

	static struct disk_exception	de_prev = { 0, 0};
	static uint64_t					num_contig_chunks = 0;

	/* presume the area is full */
	*full = 1;

	for (i = 0; i < exceptions_per_area; i++) {

		/*
		 * buf contains a bunch of disk_exceptions
		 */
		de = ((struct disk_exception *) buf) + i;

		lv_chunk = le64_to_cpu(de->lv_chunk);
		cow_chunk = le64_to_cpu(de->cow_chunk);

		/*
		 * If the cow_chunk is pointing at the start of
		 * the COW device, where the first metadata area
		 * is we know that we've hit the end of the
		 * exceptions.  Therefore the area is not full.
		 */
		if (cow_chunk == 0LL) {
			*full = 0;

//			printf("END COW BLOCK: 0x%016llx, 0x%016llx, 0x%016llx\n", 
//				de_prev.lv_chunk, de_prev.cow_chunk, num_contig_chunks);
			
			if (num_contig_chunks)
			{
				printf("COW block: LV POS=0x%016llx, COW POS=0x%016llx, LEN=%lli\n", 
							(long long)CHUNK2BYTES(de_prev.lv_chunk),
							(long long)CHUNK2BYTES(de_prev.cow_chunk),
							(long long)CHUNK2BYTES(num_contig_chunks));
			}
			break;
		}

		/*
		 * check if this entry can be merged with previous entry
		 * it can be if lv_chunk and cow_chunk both are
		 * contiguous
		 */
		if (!num_contig_chunks) {
			/*
			 * we're getting in for the first time.
			 */
			num_contig_chunks = 1;
			de_prev = *de;

		} else if ((de_prev.lv_chunk + num_contig_chunks ==
				de->lv_chunk) && (de_prev.cow_chunk +
				num_contig_chunks == de->cow_chunk)) {
			/*
			 * case of contiguous chunk.
			 */
			num_contig_chunks++;

		} else {

//			printf("BREAK COW BLOCK: 0x%016llx, 0x%016llx, 0x%016llx\n", 
//				de_prev.lv_chunk, de_prev.cow_chunk, num_contig_chunks);

			printf("COW block: LV POS=0x%016llx, COW POS=0x%016llx, LEN=%lli\n", 
						(long long)CHUNK2BYTES(de_prev.lv_chunk),
						(long long)CHUNK2BYTES(de_prev.cow_chunk),
						(long long)CHUNK2BYTES(num_contig_chunks));

			num_contig_chunks = 1;
			de_prev = *de;
		}
	}
	return 0;
}

static int dump_snapshot(int snapCowFd)
{
	uint32_t	area;
	int			full = 1;
	char		*buf;
	uint32_t	exceptions_per_area;
	uint64_t	chunk_offset, chunk_in_bytes, byte_offset;
	struct		disk_header	dh;

	/*
	 * Read the snapshot header.
	 */
	read_header(snapCowFd, &dh);

	/*
	 * Sanity checks.
	 */
	if (!dh.valid) {
		printf("read_snapshot_metadata: snapshot is marked"
							" invalid\n");
		return -1;
	}

	if (dh.version != SNAPSHOT_DISK_VERSION) {
		printf("read_snapshot_metadata: unable to handle"
			" snapshot disk version %u\n", dh.version);
		return -1;
	}

	chunk_size = dh.chunk_size;

	/*
	 * Read the metadata.
	 */
	chunk_in_bytes = (chunk_size << SECTOR_SHIFT);
	exceptions_per_area = chunk_in_bytes / sizeof (struct disk_exception);

	// Allocate an aligned buffer for each incoming disk metadata chunk
	buf = valloc(chunk_in_bytes);

	/*
	 * Keeping reading chunks until we find a partially full area.
	 */
	for (area = 0; full; area++) {
		memset(buf, 0, chunk_in_bytes);

		/*
		 * area is the index in the metadata area, which is laid
		 * out every exceptions_per_area chunks on the disk
		 * (see description@the beginning of the file)
		 */
		chunk_offset = 1 + (exceptions_per_area + 1) * area;
		byte_offset = chunk_offset * chunk_in_bytes;	

		/*
		 * read the metadata chunk
		 */
		pread_direct(snapCowFd, buf, chunk_in_bytes, byte_offset); 
		process_mappings(snapCowFd, buf, exceptions_per_area, &full);
	}
	return 0;
}


int
main(int argc, char **argv)
{
	int			_f1, _f2;
	char		*cowdevname;
	int 		snapCowFd;
	
	if (argc != 2) {
		printf("Usage: %s <snapshot>\n", argv[0]);
		return -1;
	}

	_f1 = 1;
	_f2 = 2;

	// If we open the COW block device, we MUST open it in O_DIRECT mode to
	// stop Linux caching it.  If instead we opened the LV snapshot rather than
	// the COW file, we could use normal file I/O (although it would be less
	// efficient as we already know the snapshot->COW mapping data).
	if (convert_to_mapper(argv[_f1], &cowdevname) < 0)
	{
		printf("%s: Bad snapshot name: %s\n", argv[0], argv[_f1]);
		return -1;
	}

	snapCowFd = open(cowdevname, O_RDONLY|O_DIRECT);
	if (snapCowFd < 0) 
	{
		printf("%s: Unable to open %s\n", argv[0], argv[_f1]);
		return -1;
	}

	return dump_snapshot(snapCowFd);
}


------=_NextPart_000_0363_01C6E246.A6915BD0
Content-Type: text/plain;
	name="lvmerge_snap2lv.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lvmerge_snap2lv.c"

#ifndef _GNU_SOURCE=0A=
# define _GNU_SOURCE=0A=
#endif=0A=
#ifndef _FILE_OFFSET_BITS=0A=
# define _FILE_OFFSET_BITS 64           ///< We must be in 64-bit file =
I/O mode=0A=
#endif=0A=
#ifndef _XOPEN_SOURCE=0A=
# define _XOPEN_SOURCE 500=0A=
#endif=0A=
=0A=
#include <sys/stat.h>=0A=
#include <sys/types.h>=0A=
#include <stdint.h>=0A=
#include <stdio.h>=0A=
#include <unistd.h>=0A=
#include <string.h>=0A=
#include <stdlib.h>=0A=
#include <inttypes.h>=0A=
#include <fcntl.h>=0A=
#include <errno.h>=0A=
#include <malloc.h>=0A=
=0A=
/* FROM dm.h */=0A=
#define SECTOR_SHIFT	9=0A=
#define SECSIZE		512=0A=
=0A=
/*=0A=
 * Magic for persistent snapshots=0A=
 */=0A=
#define SNAP_MAGIC 0x70416e53=0A=
=0A=
/*=0A=
 * The on-disk version of the metadata=0A=
 */=0A=
#define SNAPSHOT_DISK_VERSION 1=0A=
=0A=
/*=0A=
 * LVM snapshot on-disk Layout=0A=
 *=0A=
 * The disk is divided into chunks each of (chunk_size * sector_size) =
bytes.=0A=
 * The boxes below represent chunks. chunk_size itself is stored in the =
header.=0A=
 *=0A=
 *      +-------+ 0=0A=
 *      |       | =3D=3D=3D=3D> contain header info=0A=
 *      |       |=0A=
 *      |       |=0A=
 *      |-------| 1=0A=
 *      |       | =3D=3D=3D=3D> contains metadata. i.e. =
exceptions_per_area (say X)=0A=
 *      |       |       (lv_chunk, cow_chunk) pairs. the next X chunks =
have=0A=
 *      |       |       the actual data.=0A=
 *      |-------| 2=0A=
 *      |       |=0A=
 *      |       |=0A=
 *      |       |=0A=
 *      |-------| 3=0A=
 *      .       .=0A=
 *      .       .=0A=
 *      .       .=0A=
 *      |-------| X + 2=0A=
 *      |       | =3D=3D=3D=3D=3D> meta data chunk again ! similar to 1.=0A=
 *      |       |=0A=
 *      |       |=0A=
 *      |-------| X + 3=0A=
 *      .       .=0A=
 *      .       .=0A=
 *      .       .=0A=
 * =0A=
 * Speficially, with an 8192 byte chunk size and 16 bytes per exception =
entry,=0A=
 * we have 512 exception entries per metadata chunk.  The disk layout is =0A=
 * therefore:=0A=
 *		0x00000000	Header Information=0A=
 *		0x00002000  1st Metadata area: 512 exception entries=0A=
 *		0x00004000  1st exception data block=0A=
 *		0x00006000  2nd exception data block=0A=
 *			...=0A=
 *		0x00402000	512th exception data block=0A=
 *		0x00404000  2nd Metadata area: 512 exception entries=0A=
 *		0x00406000  1st exception data block=0A=
 *		0x00408000  2nd exception data block=0A=
 *			...=0A=
 *		0x00804000	512th exception data block=0A=
 *		0x00806000  3rd Metadata area: 512 exception entries=0A=
 *			etc=0A=
 *=0A=
 * =0A=
 * The snapshot COW table is filled from the beginning to the end.  Each =0A=
 * metadata area is completely filled so the end of the file can be =
determined=0A=
 * by looking for a metadata area where the COW chunk offset is 0.  This =
is =0A=
 * illegal because offset 0 in the COW file is the header and not a data =
block,=0A=
 * and therefore marks the end of the table.=0A=
 *=0A=
 * There is no attempt to optimise the table for faster searches using =
hash=0A=
 * tables or similar.  These may be done if the table is loaded into =
memory and=0A=
 * then restructured.  If the table is not loaded into memory and the =
on-disk =0A=
 * layout must be used, a linear search is the only solution to =
determine if a =0A=
 * COW block exists.  This is not a problem if the COW data is small, =
but if=0A=
 * the LV is large and the COW proportion significant then a lot of =
metadata =0A=
 * must be read from disk (or cached in memory).=0A=
 * 		e.g. 100GB LV with 10% COW=0A=
 *			COW data =3D 10GB=0A=
 *			COW data blocks =3D 1,310,720 blocks=0A=
 *			COW metadata areas =3D 2,560=0A=
 *			COW metadata total size =3D 20MB=0A=
 *=0A=
 * Hence, in this example, checking to see if a single 8KB block of data =
exists=0A=
 * in the COW will require up to 2,560 separate disk reads totalling 20 =
MB of =0A=
 * data.=0A=
 */=0A=
=0A=
=0A=
struct disk_header {=0A=
	uint32_t magic;=0A=
=0A=
	/*=0A=
	 * Is this snapshot valid.  There is no way of recovering=0A=
	 * an invalid snapshot.=0A=
	 */=0A=
	uint32_t valid;=0A=
=0A=
	/*=0A=
	 * Simple, incrementing version. no backward=0A=
	 * compatibility.=0A=
	 */=0A=
	uint32_t version;=0A=
=0A=
	/* In sectors */=0A=
	uint32_t chunk_size;=0A=
=0A=
	// The rest of the header chunk is unused=0A=
};=0A=
=0A=
struct disk_exception {=0A=
	uint64_t lv_chunk;=0A=
	uint64_t cow_chunk;=0A=
};=0A=
=0A=
=0A=
#define		CHUNK2SECTOR(_sec)		((_sec) * chunk_size)=0A=
#define		SECTOR2CHUNK(_chunk)	((_chunk) / chunk_size)=0A=
#define		CHUNK2BYTES(_sec)		((CHUNK2SECTOR(_sec))* (1 << SECTOR_SHIFT))=0A=
=0A=
#define DISK_BUF_SIZE		(1024*1024)=0A=
=0A=
#if __BYTE_ORDER =3D=3D __LITTLE_ENDIAN=0A=
#define le32_to_cpu(x) (x)=0A=
#define le64_to_cpu(x) (x)=0A=
#else=0A=
#define le32_to_cpu(x) __bswap_32(x)=0A=
#define le64_to_cpu(x) __bswap_64(x)=0A=
#endif=0A=
=0A=
/*=0A=
 * Globals used in the file=0A=
 */=0A=
int32_t	chunk_size;	/* chunk size in sectors */=0A=
=0A=
// =
-------------------------------------------------------------------------=
---=0A=
// Wrapper functions since it is permitted for a file read/write =
operation to =0A=
// return a partial result.=0A=
// =
-------------------------------------------------------------------------=
---=0A=
=0A=
ssize_t safe_pread(int fildes, void *buf, size_t nbyte, off_t offset)=0A=
{=0A=
	ssize_t res;=0A=
	ssize_t total;=0A=
=0A=
//	printf("safe_pread(%i,%p,%lli,0x%016llx)\n", fildes, buf, =
(off_t)nbyte, offset);=0A=
	for(total =3D 0; total < nbyte; total +=3D res)=0A=
	{=0A=
		res =3D pread(fildes, buf + total, nbyte - total, offset + total);=0A=
		if (res < 0)=0A=
		{=0A=
			fprintf(stderr,"File read error in %s line %i, error %i (%s)\n", =0A=
				__FILE__, __LINE__, errno, strerror(errno));=0A=
			exit(1);=0A=
		}=0A=
	}=0A=
	return total;=0A=
}=0A=
=0A=
ssize_t safe_pwrite(int fildes, void *buf, size_t nbyte, off_t offset)=0A=
{=0A=
	ssize_t res;=0A=
	ssize_t total;=0A=
//	printf("safe_pwrite(%i,%p,%lli,0x%016llx)\n", fildes, buf, =
(off_t)nbyte, offset);=0A=
	for(total =3D 0; total < nbyte; total +=3D res)=0A=
	{=0A=
		res =3D pwrite(fildes, buf + total, nbyte - total, offset + total);=0A=
		if (res < 0)=0A=
		{=0A=
			fprintf(stderr,"File read error in %s line %i, error %i (%s)\n",=0A=
				__FILE__, __LINE__, errno, strerror(errno));=0A=
			exit(1);=0A=
		}=0A=
	}=0A=
	return total;=0A=
}=0A=
=0A=
// =
-------------------------------------------------------------------------=
---=0A=
// Wrapper functions to allow O_DIRECT file access to be robust like =
general=0A=
// file access.  This has a performance impact if it has to rewrite the =
call=0A=
// but makes life much easier@the higher layers.=0A=
// =
-------------------------------------------------------------------------=
---=0A=
=0A=
int isAligned(off_t offset)=0A=
{=0A=
	int pagesize=3Dgetpagesize();=0A=
	return !(offset % pagesize);=0A=
}=0A=
=0A=
off_t getPageBase(off_t offset)=0A=
{=0A=
	int pagesize=3Dgetpagesize();=0A=
	return (offset/pagesize)*pagesize;=0A=
}=0A=
=0A=
off_t getPageOffset(off_t offset)=0A=
{=0A=
	int pagesize=3Dgetpagesize();=0A=
	return offset % pagesize;=0A=
}=0A=
=0A=
ssize_t getPageLength(off_t offset, ssize_t len)=0A=
{=0A=
	int pagesize=3Dgetpagesize();=0A=
	return ((offset+len + pagesize - 1)/pagesize)*pagesize;=0A=
}=0A=
=0A=
ssize_t pread_direct(int fd, void *buf, size_t nbyte, off_t pos)=0A=
{=0A=
	if (isAligned((unsigned)buf) && isAligned(nbyte) && isAligned(pos))=0A=
	{=0A=
//		printf("SAFE PREAD DIRECT\n");=0A=
		// All parameters are safe, so call directly.=0A=
		return safe_pread(fd, buf, nbyte, pos); =0A=
	}=0A=
	else=0A=
	{=0A=
		// We cannot take any chances so we must reallocate the required buffer=0A=
		ssize_t r;=0A=
		off_t readBase =3D getPageBase(pos);=0A=
		off_t readLen =3D getPageLength(pos, nbyte);=0A=
=0A=
		void *alignedbuff =3D valloc(readLen);=0A=
		if (!alignedbuff)=0A=
		{=0A=
			printf("Cannot allocate buffer\n");=0A=
			exit(1);=0A=
		}=0A=
=0A=
//		printf("UNSAFE PREAD DIRECT(%i,%p,%lli,0x%016llx)\n", fd, buf, =
(off_t)nbyte, pos);=0A=
		=0A=
		r =3D safe_pread(fd, alignedbuff, readLen, readBase); =0A=
		if (r < 0) {=0A=
			fprintf(stderr,"File read error in %s line %i, error %i (%s)\n",=0A=
				__FILE__, __LINE__, errno, strerror(errno));=0A=
			exit(1);=0A=
		}=0A=
=0A=
		memcpy(buf, alignedbuff + getPageOffset(pos), nbyte);=0A=
		free(alignedbuff);=0A=
		return (nbyte < r)?nbyte:r;=0A=
	}=0A=
}=0A=
=0A=
void restore_cow_block(int ofd, int ifd, off_t dst, off_t src, ssize_t =
length)=0A=
{=0A=
	ssize_t allocSize =3D (DISK_BUF_SIZE < length)?DISK_BUF_SIZE:length;=0A=
	char *buf =3D valloc(allocSize);=0A=
=0A=
//	printf("restore_cow_block(%i,%i,0x%016llx,0x%016llx, %lli)\n", =0A=
//			ofd, ifd, dst, src, (long long)length);=0A=
=0A=
	off_t done, burst;=0A=
	for(done =3D 0; done < length; done +=3D burst)=0A=
	{=0A=
		off_t remaining =3D length - done;=0A=
		burst =3D (remaining > allocSize)?allocSize:remaining;=0A=
=0A=
		pread_direct(ifd, buf, burst, src + done);=0A=
		safe_pwrite(ofd, buf, burst, dst + done);=0A=
	}=0A=
	free(buf);=0A=
}=0A=
=0A=
=0A=
static int=0A=
read_header(int ifd, struct disk_header *dh)=0A=
{=0A=
	pread_direct(ifd, dh, sizeof(*dh), 0); =0A=
=0A=
	// Perform endian corrections in-situ=0A=
	dh->valid =3D le32_to_cpu(dh->valid);=0A=
	dh->version =3D le32_to_cpu(dh->version);=0A=
	dh->chunk_size =3D le32_to_cpu(dh->chunk_size);=0A=
	return 0;=0A=
}=0A=
=0A=
/*=0A=
 * convert (if reqd),=0A=
 *	from :	/dev/vg/lv=0A=
 *=0A=
 *	to   :	/dev/mapper/vg-lv-cow=0A=
 */=0A=
static int=0A=
convert_to_mapper(char *lvm_dev, char **mapper_dev)=0A=
{=0A=
	char	*lv;=0A=
=0A=
	if (lvm_dev[0] !=3D '/') {=0A=
		printf("convert_to_mapper: %s not an absolute path\n",=0A=
								lvm_dev);	=0A=
		return -1;=0A=
	}=0A=
=0A=
	/* 5 -> "/dev/" */=0A=
	if (!(lv =3D strrchr(lvm_dev + 5, '/'))) {=0A=
		printf("convert_to_mapper: invalid path %s\n", lvm_dev);	=0A=
		return -1;=0A=
	}=0A=
=0A=
	/*=0A=
	 * check if this is already a mapper device=0A=
	 */=0A=
	if (!strncmp(lvm_dev + 5, "mapper", 6)) {=0A=
		printf("convert_to_mapper: should not already be a mapper path %s\n", =
lvm_dev);	=0A=
		return -1;	=0A=
	}	=0A=
=0A=
	/* 12 -> "mapper", "-", "-cow", '\0' */=0A=
	*mapper_dev =3D malloc(strlen(lvm_dev) + 12);=0A=
	strcpy(*mapper_dev, "/dev/mapper/");=0A=
=0A=
	/* copy vg */=0A=
	strncat(*mapper_dev, lvm_dev + 5, (size_t) (lv - (lvm_dev + 5)));=0A=
	strcat(*mapper_dev, "-");=0A=
=0A=
	/* copy lv */=0A=
	strcat(*mapper_dev, lv + 1);=0A=
	strcat(*mapper_dev, "-cow");=0A=
=0A=
	return 0;=0A=
}=0A=
=0A=
=0A=
static int process_mappings(int snapCowFd, int lvFd, char *buf, uint32_t =
exceptions_per_area, int *full)=0A=
{=0A=
	unsigned int			i;=0A=
	uint64_t				lv_chunk, cow_chunk;=0A=
	struct disk_exception	*de;=0A=
=0A=
	static struct disk_exception	de_prev =3D { 0, 0};=0A=
	static uint64_t					num_contig_chunks =3D 0;=0A=
=0A=
	/* presume the area is full */=0A=
	*full =3D 1;=0A=
=0A=
	for (i =3D 0; i < exceptions_per_area; i++) {=0A=
=0A=
		/*=0A=
		 * buf contains a bunch of disk_exceptions=0A=
		 */=0A=
		de =3D ((struct disk_exception *) buf) + i;=0A=
=0A=
		lv_chunk =3D le64_to_cpu(de->lv_chunk);=0A=
		cow_chunk =3D le64_to_cpu(de->cow_chunk);=0A=
=0A=
		/*=0A=
		 * If the cow_chunk is pointing at the start of=0A=
		 * the COW device, where the first metadata area=0A=
		 * is we know that we've hit the end of the=0A=
		 * exceptions.  Therefore the area is not full.=0A=
		 */=0A=
		if (cow_chunk =3D=3D 0LL) {=0A=
			*full =3D 0;=0A=
=0A=
//			printf("END COW BLOCK: 0x%016llx, 0x%016llx, 0x%016llx\n", =0A=
//				de_prev.lv_chunk, de_prev.cow_chunk, num_contig_chunks);=0A=
			=0A=
			if (num_contig_chunks)=0A=
			{=0A=
				restore_cow_block(lvFd, snapCowFd, =0A=
							CHUNK2BYTES(de_prev.lv_chunk),=0A=
							CHUNK2BYTES(de_prev.cow_chunk),=0A=
							CHUNK2BYTES(num_contig_chunks));=0A=
			}=0A=
			break;=0A=
		}=0A=
=0A=
		/*=0A=
		 * check if this entry can be merged with previous entry=0A=
		 * it can be if lv_chunk and cow_chunk both are=0A=
		 * contiguous=0A=
		 */=0A=
		if (!num_contig_chunks) {=0A=
			/*=0A=
			 * we're getting in for the first time.=0A=
			 */=0A=
			num_contig_chunks =3D 1;=0A=
			de_prev =3D *de;=0A=
=0A=
		} else if ((de_prev.lv_chunk + num_contig_chunks =3D=3D=0A=
				de->lv_chunk) && (de_prev.cow_chunk +=0A=
				num_contig_chunks =3D=3D de->cow_chunk)) {=0A=
			/*=0A=
			 * case of contiguous chunk.=0A=
			 */=0A=
			num_contig_chunks++;=0A=
=0A=
		} else {=0A=
=0A=
//			printf("BREAK COW BLOCK: 0x%016llx, 0x%016llx, 0x%016llx\n", =0A=
//				de_prev.lv_chunk, de_prev.cow_chunk, num_contig_chunks);=0A=
=0A=
			restore_cow_block(lvFd, snapCowFd, =0A=
						CHUNK2BYTES(de_prev.lv_chunk),=0A=
						CHUNK2BYTES(de_prev.cow_chunk),=0A=
						CHUNK2BYTES(num_contig_chunks));=0A=
=0A=
			num_contig_chunks =3D 1;=0A=
			de_prev =3D *de;=0A=
		}=0A=
	}=0A=
	return 0;=0A=
}=0A=
=0A=
static int process_snapshot(int snapCowFd, int lvFd)=0A=
{=0A=
	uint32_t	area;=0A=
	int			full =3D 1;=0A=
	char		*buf;=0A=
	uint32_t	exceptions_per_area;=0A=
	uint64_t	chunk_offset, chunk_in_bytes, byte_offset;=0A=
	struct		disk_header	dh;=0A=
=0A=
	/*=0A=
	 * Read the snapshot header.=0A=
	 */=0A=
	read_header(snapCowFd, &dh);=0A=
=0A=
	/*=0A=
	 * Sanity checks.=0A=
	 */=0A=
	if (!dh.valid) {=0A=
		printf("read_snapshot_metadata: snapshot is marked"=0A=
							" invalid\n");=0A=
		return -1;=0A=
	}=0A=
=0A=
	if (dh.version !=3D SNAPSHOT_DISK_VERSION) {=0A=
		printf("read_snapshot_metadata: unable to handle"=0A=
			" snapshot disk version %u\n", dh.version);=0A=
		return -1;=0A=
	}=0A=
=0A=
	chunk_size =3D dh.chunk_size;=0A=
=0A=
	/*=0A=
	 * Read the metadata.=0A=
	 */=0A=
	chunk_in_bytes =3D (chunk_size << SECTOR_SHIFT);=0A=
	exceptions_per_area =3D chunk_in_bytes / sizeof (struct disk_exception);=0A=
=0A=
	// Allocate an aligned buffer for each incoming disk metadata chunk=0A=
	buf =3D valloc(chunk_in_bytes);=0A=
=0A=
	/*=0A=
	 * Keeping reading chunks until we find a partially full area.=0A=
	 */=0A=
	for (area =3D 0; full; area++) {=0A=
		memset(buf, 0, chunk_in_bytes);=0A=
=0A=
		/*=0A=
		 * area is the index in the metadata area, which is laid=0A=
		 * out every exceptions_per_area chunks on the disk=0A=
		 * (see description@the beginning of the file)=0A=
		 */=0A=
		chunk_offset =3D 1 + (exceptions_per_area + 1) * area;=0A=
		byte_offset =3D chunk_offset * chunk_in_bytes;	=0A=
=0A=
		/*=0A=
		 * read the metadata chunk=0A=
		 */=0A=
		pread_direct(snapCowFd, buf, chunk_in_bytes, byte_offset); =0A=
		process_mappings(snapCowFd, lvFd, buf, exceptions_per_area, &full);=0A=
	}=0A=
	return 0;=0A=
}=0A=
=0A=
=0A=
int=0A=
main(int argc, char **argv)=0A=
{=0A=
	int			_f1, _f2;=0A=
	char		*cowdevname;=0A=
	int 		snapCowFd, lvFd;=0A=
	=0A=
	if (argc !=3D 3) {=0A=
		printf("Usage: %s <snapshot> <lv>\n", argv[0]);=0A=
		return -1;=0A=
	}=0A=
=0A=
	_f1 =3D 1;=0A=
	_f2 =3D 2;=0A=
=0A=
	// If we open the COW block device, we MUST open it in O_DIRECT mode to=0A=
	// stop Linux caching it.  If instead we opened the LV snapshot rather =
than=0A=
	// the COW file, we could use normal file I/O (although it would be less=0A=
	// efficient as we already know the snapshot->COW mapping data).=0A=
	if (convert_to_mapper(argv[_f1], &cowdevname) < 0)=0A=
	{=0A=
		printf("%s: Bad snapshot name: %s\n", argv[0], argv[_f1]);=0A=
		return -1;=0A=
	}=0A=
=0A=
	snapCowFd =3D open(cowdevname, O_RDONLY|O_DIRECT);=0A=
	if (snapCowFd < 0) =0A=
	{=0A=
		printf("%s: Unable to open %s\n", argv[0], argv[_f1]);=0A=
		return -1;=0A=
	}=0A=
=0A=
	// The output LV can be opened in the normal way and can be cached if =
the=0A=
	// system wants to.=0A=
	lvFd =3D open(argv[_f2], O_RDWR);=0A=
	if (lvFd < 0) =0A=
	{=0A=
		printf("%s: Unable to open %s\n", argv[0], argv[_f2]);=0A=
		return -1;=0A=
	}=0A=
=0A=
	return process_snapshot(snapCowFd, lvFd);=0A=
}=0A=
=0A=

------=_NextPart_000_0363_01C6E246.A6915BD0--
