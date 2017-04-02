package com.graduate.base;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

/**
 * 分页基本类
 * 
 * @author cx
 *
 * @param <T>
 */
public class Page<T> implements Serializable {

	public static final int MIN_PAGESIZE = 10;
	public static final int MAX_PAGESIZE = 200;
	protected int pageNumber = 1;
	protected int pageSize = 10;
	protected int totalPages;
	protected int totalRows;

	protected List<T> list = null;

	public Page() {
	}

	public Page(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNumber() {
		return this.pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;

		if (pageNumber < 1)
			this.pageNumber = 1;
	}

	public int getPageSize() {
		return this.pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;

		if (pageSize < MIN_PAGESIZE) {
			this.pageSize = MIN_PAGESIZE;
		}
		if (pageSize > MAX_PAGESIZE)
			this.pageSize = MAX_PAGESIZE;
	}

	public int getFirst() {
		return (this.pageNumber - 1) * this.pageSize;
	}

	public List<T> getList() {
		if (this.list == null)
			return Collections.emptyList();
		return this.list;
	}

	public void setResult(List<T> list) {
		this.list = list;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
		totalPages = ((totalRows + pageSize) - 1) / pageSize;
	}
}